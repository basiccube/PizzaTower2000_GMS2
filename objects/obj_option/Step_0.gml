scr_getinput()
if (keyUp_pressed && optionselected > 0)
{
    optionselected -= 1
    snd_play(sfx_step)
}
if (keyDown_pressed && optionselected < 2)
{
    optionselected += 1
    snd_play(sfx_step)
}

if (optionselected == 0)
{
    if (keyRight_pressed && optionsaved_highperformance == 0)
        optionsaved_highperformance = 1
    if (-keyLeft_pressed && optionsaved_highperformance > 0)
        optionsaved_highperformance = 0
}
if (optionselected == 1)
{
    if (keyRight_pressed && optionsaved_debug == 0)
        optionsaved_debug = 1
    if (-keyLeft_pressed && optionsaved_debug > 0)
        optionsaved_debug = 0
}
if (optionselected == 2)
{
    if (keyRight_pressed && optionsaved_showcollisions == 0)
        optionsaved_showcollisions = 1
    if (-keyLeft_pressed && optionsaved_showcollisions > 0)
        optionsaved_showcollisions = 0
}

if (keySlap_pressed || keyEscape)
{
    snd_play(sfx_enemyprojectile)
    with (obj_debugController)
    {
        debugInfo = other.optionsaved_debug
        showCollisions = other.optionsaved_showcollisions
		save_config()
    }
    global.highperformance = optionsaved_highperformance
    
    ini_open("saveData.ini")
    ini_write_real("Option", "HighPerformance", optionsaved_highperformance)
    ini_close()
    
    instance_destroy()
}