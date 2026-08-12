with (obj_player)
	state.change(PLAYER_GATESHUT)

obj_tv.showtext = 1
obj_tv.message = "UH OH..."
obj_tv.alarm[0] = 150

// Read level time limit from level info file
if (is_string(global.leveltosave))
{
    if (file_exists("levels\\" + global.leveltosave + ".pli"))
    {
        tempini_open("levels\\" + global.leveltosave + ".pli")
        global.minutes = ini_read_real("Level", "Minutes", 3)
        global.seconds = ini_read_real("Level", "Seconds", 30)
        global.escapesong = ini_read_string("Level", "EscapeSong", "mu_pizzatime")
        tempini_close()
    }
}
else
{
    global.minutes = 3
    global.seconds = 30
    global.escapesong = "mu_pizzatime"
}
global.style += 25
