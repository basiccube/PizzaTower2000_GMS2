if !instance_exists(obj_quitprompt)
{
    scr_getinput()
    if (keyUp_pressed && optionselect > 0)
    {
        optionselect -= 1
        snd_play(sfx_step)
    }
    else if (keyDown_pressed && optionselect < 3)
    {
        optionselect += 1
        snd_play(sfx_step)
    }
    
    if (optionselect == 0)
        cursory = (global.screenh / 2) - 16
    else if (optionselect == 1)
        cursory = (global.screenh / 2) + 24
    else if (optionselect == 2)
        cursory = (global.screenh / 2) + 64
    else if (optionselect == 3)
        cursory = (global.screenh / 2) + 104
        
    if keyJump_pressed
    {
        switch optionselect
        {
            case 0:
            case 1:
                obj_titlecutscene.move = true
                if (optionselect == 1)
                    obj_titlecutscene.targetRoom = rm_level_select
                snd_play(sfx_collecttoppin)
                instance_destroy()
                with (obj_title)
                    instance_destroy()
                with (obj_controls)
                    instance_destroy()
                break
            
            case 2:
                snd_play(sfx_enemyprojectile)
                break
            
            case 3:
                snd_play(sfx_enemyprojectile)
                instance_create(x, y, obj_quitprompt)
                break
        }
    }
}