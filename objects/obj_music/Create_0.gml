global.music = ds_map_create()
global.escapesong = "mu_pizzatime"

if directory_exists("music")
{
	var file = file_find_first("music/*.ogg", fa_none)
	while (file != "")
	{
		var name = filename_change_ext(file, "")
		ds_map_set(global.music, name, name)
		file = file_find_next()
	}
	file_find_close()
}

currentlyplaying = ds_map_find_value(global.music, "mu_title")
currentmusic = ""
jingle = false