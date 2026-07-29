scr_getinput()
if (-keyLeft_pressed && selected > 0)
{
    selected -= 1
    snd_play(sfx_step)
}
if (keyRight_pressed && selected < 1)
{
    selected += 1
    snd_play(sfx_step)
}

if (inputbuffer > 0)
    inputbuffer -= 1
if (inputbuffer <= 0)
{
    if (selected == 0 && keyJump_pressed)
        game_end()
    if (selected == 1 && keyJump_pressed)
        instance_destroy()
}
