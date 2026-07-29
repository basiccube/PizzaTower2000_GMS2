function scr_player_facestomp() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	jumpAnim = 0
	hsp = (move * movespeed)
	if ((scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1))
	    movespeed = 0
	if (move == 0)
	    movespeed = 0
	if (move != 0 && movespeed < 6)
	    movespeed += 0.5
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	landAnim = 1
	if (vsp >= 16)
	{
	    state = 65
	    superslam = 1
	}
	if (grounded && ((!(place_meeting(x, (y + 1), obj_destructibles))) || place_meeting(x, (y + 1), obj_metalblock)) && vsp > 0)
	{
	    snd_play(sfx_groundpound)
		snd_play(sfx_step)
	    state = 68
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    freefallstart = 0
	}
	if (facestompAnim == 0)
	    sprite_index = spr_player_facestomp
	else if (facestompAnim == 1)
	{
	    sprite_index = spr_player_facestomphit
	    if (floor(image_index) == 5)
	        facestompAnim = 0
	}
	if (move != 0)
	    xscale = move
	image_speed = 0.35



}
