#macro SETTINGS_FILE "config/settings.ini"

#macro IMG_BG_PATH "bg/"
#macro BACKGROUND_PATH IMGBUF_PATH + IMG_BG_PATH
#macro TILESET_PATH "tilesets/"

global.startRoom = ""
global.startDoor = ""

global.background_map = ds_map_create()
global.tileset_map = ds_map_create()

function init_game()
{
	for (var i = 0, n = parameter_count(); i < n; i++)
	{
		var str = parameter_string(i)
		switch str
		{
			case "-room":
				var rm = parameter_string(i + 1)
				var door = parameter_string(i + 2)
				
				if (rm != "" && door != "" && !string_starts_with(rm, "-") && !string_starts_with(door, "-"))
				{
					global.startRoom = rm
					global.startDoor = door
				}
				break
				
			case "-printex":
				global.print_extra = true
				break
				
			case "-log":
				global.print_logfile = true
				break
				
			case "-clearlog":
				if file_exists(PRINT_LOGPATH)
					file_delete(PRINT_LOGPATH)
				break
				
			case "-w":
				var w = parameter_string(i + 1)
				if (w != "" && string_digits(w) != "")
					global.screenw = real(string_digits(w))
				break
			
			case "-h":
				var h = parameter_string(i + 1)
				if (h != "" && string_digits(h) != "")
					global.screenh = real(string_digits(h))
				break
		}
	}
	
	if (GM_build_type == "run")
		global.print_extra = true
	
	global.leveltosave = -4
	stats_reset()
}

function init_load_settings()
{
	ini_open(SETTINGS_FILE)
	global.hud = ini_read_real("Game", "HUD", 0)
	ini_close()
}

function init_load_backgrounds()
{
	if !directory_exists(BACKGROUND_PATH)
		exit;
	
	var count = 0
	var file = file_find_first(BACKGROUND_PATH + "*" + IMGBUF_EXT, fa_none)
	while (file != "")
	{
		var name = filename_change_ext(file, "")
		var path = IMG_BG_PATH + name
		
		var sprite = imgbuf_load(path)
		if (sprite != undefined)
		{
			printex("Loading background ", name, ", asset name: ", sprite)
			ds_map_set(global.background_map, name, sprite)
			count++
		}
		
		file = file_find_next()
	}
	file_find_close()
	
	print("Loaded ", count, " backgrounds")
}

function init_load_tilesets()
{
	if !directory_exists(TILESET_PATH)
		exit;
	
	var count = 0
	var file = file_find_first(TILESET_PATH + "*.png", fa_none)
	while (file != "")
	{
		var name = filename_change_ext(file, "")
		var sprite = sprite_add(TILESET_PATH + file, 0, true, false, 0, 0)
		if (sprite != -1)
		{
			printex("Loading tileset ", name, ", asset name: ", sprite)
			ds_map_set(global.tileset_map, name, sprite)
			count++
		}
		
		file = file_find_next()
	}
	file_find_close()
	
	print("Loaded ", count, " tilesets")
}

function init_load_sprites()
{
	if SPRITE_LOADER_ENABLED
	{
		for (var i = 0; sprite_exists(i); i++)
			sprloader_load(i)
	}
}