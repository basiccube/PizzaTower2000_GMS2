#macro SPRITE_PARAM_CENTERORIGIN "centerOrigin"
#macro SPRITE_PARAM_REMOVEBACK "removeBack"

#macro SPRITE_CENTER -2716285

#macro SPRITE_LOADER_ENABLED false
#macro SPRITE_PATH "gfx"

global.sprite_loading = false

if SPRITE_LOADER_ENABLED
{
function sprloader_get_strip(file)
{
	var struct = {
		path : file,
		nostrippath : file,
		
		extension : filename_ext(file),
		name : filename_change_ext(filename_name(file), ""),
		subimages : 1
	}
	
	var pathNoExt = filename_change_ext(file, "")
	
	var stripStr = "_strip"
	var stripPos = string_last_pos(stripStr, pathNoExt)
	if (stripPos != 0)
	{
		var noStrip = false
		var numstr = ""
		
		for (var i = stripPos + string_length(stripStr), n = string_length(pathNoExt); i <= n; i++)
		{
			var c = string_char_at(pathNoExt, i)
			if (string_digits(c) != "")
				numstr += c
			else
			{
				noStrip = true
				break;
			}
		}
		
		if !noStrip
		{
			struct.subimages = real(numstr)
			
			var npath = string_copy(pathNoExt, 1, stripPos - 1)
			struct.name = filename_name(npath)
			struct.nostrippath = npath + struct.extension
		}
	}
	
	return struct;
}

function sprloader_get_sprite_info(strip, params = [])
{
	var struct = {
		originX : 0,
		originY : 0,
		spriteSpeed : 1
	}
	
	if array_contains(params, SPRITE_PARAM_CENTERORIGIN)
	{
		struct.originX = SPRITE_CENTER
		struct.originY = SPRITE_CENTER
	}
	
	var iniPath = filename_change_ext(strip.path, ".ini")
	var iniPath2 = filename_change_ext(strip.nostrippath, ".ini")
	
	var usedIniPath = undefined
	if file_exists(iniPath)
		usedIniPath = iniPath
	else if file_exists(iniPath2)
		usedIniPath = iniPath2
	
	if (usedIniPath != undefined)
	{
		ini_open(usedIniPath)
		with (struct)
		{
			if ini_read_real("Sprite", "CenterOrigin", false)
			{
				originX = SPRITE_CENTER
				originY = SPRITE_CENTER
			}
			
			originX = ini_read_real("Sprite", "OriginX", originX)
			originY = ini_read_real("Sprite", "OriginY", originY)
			spriteSpeed = ini_read_real("Sprite", "Speed", spriteSpeed)
			
			if ini_read_real("Sprite", "RemoveBack", false)
				array_push(params, SPRITE_PARAM_REMOVEBACK)
		}
		ini_close()
	}
	
	return struct;
}

///@param {String} file
///@param {Array} params
function sprloader_add(file, params = [])
{
	var strip = sprloader_get_strip(file)
	var spriteInfo = sprloader_get_sprite_info(strip, params)
	
	var ox = spriteInfo.originX
	var oy = spriteInfo.originY
	
	var centerX = (ox == SPRITE_CENTER)
	var centerY = (oy == SPRITE_CENTER)
	if centerX
		ox = 0
	if centerY
		oy = 0
		
	var removeBack = array_contains(params, SPRITE_PARAM_REMOVEBACK)
	var sprite = sprite_add(strip.path, strip.subimages, removeBack, false, ox, oy)
	
	if (centerX || centerY)
	{
		var nox = centerX ? sprite_get_width(sprite) / 2 : ox
		var noy = centerY ? sprite_get_height(sprite) / 2 : oy
		sprite_set_offset(sprite, nox, noy)
	}
	sprite_set_speed(sprite, spriteInfo.spriteSpeed, spritespeed_framespergameframe)
	
	return sprite;
}

function sprloader_load(index)
{
	if global.butterscotch
		exit;
	
	var name = sprite_get_name(index)
	var tags = asset_get_tags(index, asset_sprite)
	if (array_length(tags) <= 0)
		exit;
		
	if array_contains(tags, "ignore")
		exit;
	
	var params = []
	if array_contains(tags, "centered")
		array_push(params, SPRITE_PARAM_CENTERORIGIN)
	
	var path = ""
	for (var i = 0, n = array_length(tags); i < n; i++)
	{
		var tag = tags[i]
		if (tag == "centered")
			continue;
		
		var searchpath = $"{SPRITE_PATH}/{tag}"
		
		var found = false
		var file = file_find_first($"{searchpath}/{name}*", fa_none)
		while (file != "")
		{
			var ext = filename_ext(file)
			if (ext == ".png" || ext == ".gif")
			{
				searchpath += $"/{file}"
				found = true
				break;
			}
			
			file = file_find_next()
		}
		file_find_close()
		
		if found
		{
			path = searchpath
			break;
		}
	}
	
	if (path != "")
	{
		var spr = sprloader_add(path, params)
		sprite_assign(index, spr)
	}
}
}