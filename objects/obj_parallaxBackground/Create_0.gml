if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

depth = 9000
backgrounds = []
backgroundLayer = undefined

disabledRooms = [
	rm_initializer,
	rm_main_menu,
	rm_tower_outside,
	rm_rank_room,
	rm_timesup_room
]

add = function(spr, offset)
{ array_push(backgrounds, [spr, offset]); }

clear = function()
{ backgrounds = []; }

reset = function()
{
	for (var i = 0, n = array_length(backgrounds); i < n; i++)
	{
		var bg = backgrounds[i]
		bg[0] = undefined
	}
}

get = function(name)
{
	if ds_map_exists(global.background_map, name)
		return ds_map_find_value(global.background_map, name);
	
	var path = BACKGROUND_PATH + name + IMGBUF_EXT
	if !file_exists(path)
		return undefined;
	
	var imgpath = IMG_BG_PATH + name
	var sprite = imgbuf_load(imgpath)
	if (sprite != undefined)
	{
		printex("Loading background ", name, ", asset name: ", sprite)
		ds_map_set(global.background_map, name, sprite)
	}
	
	return sprite;
}

globalvar parallaxBackground;
parallaxBackground = id