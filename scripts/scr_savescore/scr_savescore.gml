#macro SAVE_FILE "save.ini"

function scr_savescore(level)
{
	global.rank = "d"
	if (global.collect >= global.srank)
		global.rank = "s"
	else if (global.collect > global.arank)
		global.rank = "a"
	else if (global.collect > global.brank)
		global.rank = "b"
	else if (global.collect > global.crank)
		global.rank = "c"
		
	ini_open(SAVE_FILE)
	
	if (ini_read_real("Highscore", level, 0) < global.collect)
		ini_write_real("Highscore", level, global.collect)
	if (ini_read_real("Treasure", level, 0) == 0)
		ini_write_real("Treasure", level, global.treasure)
		
	if (ini_read_real("Toppin", level + "1", 0) == 0)
		ini_write_real("Toppin", level + "1", global.shroomfollow)
	if (ini_read_real("Toppin", level + "2", 0) == 0)
		ini_write_real("Toppin", level + "2", global.cheesefollow)
	if (ini_read_real("Toppin", level + "3", 0) == 0)
		ini_write_real("Toppin", level + "3", global.tomatofollow)
	if (ini_read_real("Toppin", level + "4", 0) == 0)
		ini_write_real("Toppin", level + "4", global.sausagefollow)
	if (ini_read_real("Toppin", level + "5", 0) == 0)
		ini_write_real("Toppin", level + "5", global.pineapplefollow)
	
	scr_write_rank(level)
	ini_close()
}

function scr_write_rank(level)
{
	var _rank = ini_read_string("Ranks", level, "d")
	
	var _map = ds_map_create()
	ds_map_set(_map, "d", 0)
	ds_map_set(_map, "c", 1)
	ds_map_set(_map, "b", 2)
	ds_map_set(_map, "a", 3)
	ds_map_set(_map, "s", 4)
	
	if (ds_map_find_value(_map, global.rank) >= ds_map_find_value(_map, _rank))
		ini_write_string("Ranks", level, global.rank)
		
	ds_map_destroy(_map)
}
