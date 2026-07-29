scr_getinput()
if (keyEscape && room != rank_room && room != timesuproom && room != levelselect && !instance_exists(obj_transition))
{
    if (global.startRoom != "")
        game_end()
    
    if (!pause)
    {
        pause = true
        instance_deactivate_all(true)
    }
    else
    {
        pause = false
        instance_activate_all()
    }
}

if (!pause && image_alpha > 0)
    image_alpha -= 0.1

if (pause)
{
    if (image_alpha < 1)
        image_alpha += 0.1
    
    if (keyUp_pressed && selection > 0)
    {
        selection -= 1
        snd_play(sfx_step)
    }
    if (keyDown_pressed && selection < 2)
    {
        selection += 1
        snd_play(sfx_step)
    }
    
    if keyJump_pressed
    {
        switch selection
        {
            case 0:
            case 1:
                pause = false
                instance_activate_all()
                if (selection == 1)
                    scr_playerreset()
                selection = 0
                break
            case 2:
                ds_map_destroy(global.bg)
                ds_map_destroy(global.tilesets)
                ds_map_destroy(global.music)
				with (obj_instanceManager)
					clearInstances()
                game_restart()
                break
        }
    }
}
