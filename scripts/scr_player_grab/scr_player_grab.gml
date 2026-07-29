function scr_player_grab() {
	scr_getinput()
	if (!instance_exists(baddiegrabbedID))
	    state = 0

	grav = 0.5
	move = (keyLeft_held + keyRight_held)

	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
	    hsp = (move * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
	    hsp = ((move * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = ((move * movespeed) + 5)

	if ((!keyJump_held) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 5
	    jumpstop = 1
	}
	if (grounded && vsp > 0)
	    jumpstop = 0
    
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
	    movespeed = 0
    
	if (xscale == -move)
	    movespeed = 0
    
	if (move == 0 && grounded)
	{
	    sprite_index = spr_player_haulingidle
	    movespeed = 0
	}
	if (move != 0)
	{
	    if (grounded)
	        sprite_index = spr_player_haulingwalk
	    xscale = move
	}

	if (keyJump_pressed && grounded)
	{
	    snd_play(sfx_jump)
	    vsp = -11
	    sprite_index = spr_player_haulingjump
	    image_index = 0
	}

	if (sprite_index == spr_player_haulingjump && floor(image_index) == (image_number - 1))
	    sprite_index = spr_player_haulingfall

	if (!grounded && vsp > 0)
	    sprite_index = spr_player_haulingfall
    
	if (grounded && vsp > 0 && (sprite_index == spr_player_haulingfall || sprite_index == spr_player_haulingjump))
	    movespeed = 2
    
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5
	    else if (movespeed >= 6)
	        movespeed = 6
	}
	else
	    movespeed = 0

	if (keySlap_pressed)
	{
	    snd_play(sfx_punch)
	    state = 48
	    image_index = 0
	    image_speed = 0.35
	    movespeed = 4
	    sprite_index = spr_player_punch
	}
	else if (keyUp_held)
	{
	    snd_play(sfx_punch)
	    state = 48
	    image_index = 0
	    image_speed = 0.35
	    hsp = 0
	    movespeed = 0
	    sprite_index = spr_player_uppunch
	}
	else if keyAttack_pressed
	{
	    state = 85
	    snd_play(sfx_dash)
	    instance_create(x, y, obj_jumpdust)
	}

	if (keyDown_held && !grounded)
	{
	    snd_play(sfx_jump)
	    sprite_index = spr_player_piledriver
	    vsp = -7
	    state = 34
	    image_index = 0
	    image_speed = 0.35
	}
    
	if (move != 0 && grounded)
	{
	    if (movespeed < 3)
	        image_speed = 0.35
	    else if (movespeed > 3 && movespeed < 6)
		  image_speed = 0.45
	    else
		  image_speed = 0.6
	}
	else
	    image_speed = 0.35



}
