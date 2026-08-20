with (obj_player)
	state.change(PLAYER_GATESHUT)

global.style += 25
with (obj_tv)
{
	message = "UH OH..."
	showtext = true
	alarm[0] = 150
}

// Read level time limit from level info file
if is_string(global.leveltosave)
{
	var path = "levels/" + global.leveltosave + ".pli"
	if file_exists(path)
	{
		ini_open(path)
		global.minutes = ini_read_real("Level", "Minutes", 3)
		global.seconds = ini_read_real("Level", "Seconds", 30)
		global.escapesong = ini_read_string("Level", "EscapeSong", "mu_pizzatime")
		ini_close()
	}
}
else
{
	global.minutes = 3
	global.seconds = 30
	global.escapesong = "mu_pizzatime"
}