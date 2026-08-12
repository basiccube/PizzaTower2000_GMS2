with (obj_playerOLD)
{
    if (room == rank_room)
    {
        obj_playerOLD.x = SCREEN_WIDTH / 2
        obj_playerOLD.y = SCREEN_HEIGHT / 2
    }
}

obj_camera.visible = false
if (fadealpha > 1)
{
    fadein = true
    if (room != rank_room)
        room = rank_room
	
    snd_stop_all()
    global.panic = false
}

fadealpha += (fadein ? -0.1 : 0.1)