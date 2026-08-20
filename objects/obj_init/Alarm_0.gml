// obj_init - Initializes a bunch of stuff and loads all assets.

// Load settings
ini_open("saveData.ini")

global.highperformance = ini_read_real("Option", "HighPerformance", 0)
playerdir = ini_read_string("Option", "PlayerDir", "peppino")
sounddir = ini_read_string("Option", "SoundDir", "default")
global.hud = ini_read_real("Option", "HUD", 0)

ini_close()

// Check if the game has been restarted
restart = false
if (sprite_get_width(spr_pepcooter) > 32)
    restart = true
    
global.startRoom = ""
global.startDoor = ""

for (var i = 0, n = parameter_count(); i < n; i++)
{
	var str = parameter_string(i)
	if (str == "-room" && i < n - 2)
	{
		var rm = parameter_string(i + 1)
		var door = parameter_string(i + 2)
		
		if (!string_starts_with(rm, "-") && !string_starts_with(door, "-"))
		{
			global.startRoom = rm
			global.startDoor = door
		}
	}
}

// Load backgrounds from bg directory
global.bg = ds_map_create()
if (directory_exists("bg"))
{
    bgfile = file_find_first("bg\\*.png", 0)
    while (bgfile != "")
    {
        ds_map_add(global.bg, filename_change_ext(bgfile, ""), sprite_add("bg\\" + bgfile, 0, false, false, 0, 0))
        bgfile = file_find_next()
    }
    file_find_close()
}

// Load tilesets from tilesets directory
global.tilesets = ds_map_create()
if (directory_exists("tilesets"))
{
    tsfile = file_find_first("tilesets\\*.png", 0)
    while (tsfile != "")
    {
        ds_map_add(global.tilesets, filename_change_ext(tsfile, ""), sprite_add("tilesets\\" + tsfile, 0, true, false, 0, 0))
        tsfile = file_find_next()
    }
    file_find_close()
}

if SPRITE_LOADER_ENABLED
{
	// Load sprites
	for (var i = 0; sprite_exists(i); i++)
		sprloader_load(i)
}

global.leveltosave = -4
stats_reset()

room_goto(rm_initializer)