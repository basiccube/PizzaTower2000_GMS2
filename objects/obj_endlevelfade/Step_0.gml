with (obj_player)
{
	if (room == rank_room)
	{
		x = SCREEN_WIDTH / 2
		y = SCREEN_HEIGHT / 2
	}
}

with (obj_camera)
	visible = false

if (fadealpha > 1)
{
	fadein = true
	if (room != rank_room)
		room = rank_room
	
	snd_stop_all()
	global.panic = false
}

fadealpha += (fadein ? -0.1 : 0.1)