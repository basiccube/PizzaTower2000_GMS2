function scr_player_knightpep() {
	scr_getinput()
	alarm[4] = 2
	alarm[6] = 60
	hurted = 1
	if (sprite_index == spr_knightpep_walk || sprite_index == spr_knightpep_jump || sprite_index == spr_knightpep_fall || sprite_index == spr_knightpep_idle)
	{
	    move = (keyLeft_held + keyRight_held)
	    hsp = (move * movespeed)
	}
	else if grounded
	{
	    hsp = 0
	    move = 0
	}

	if keyJump_pressed
	    input_buffer_jump = 0
	if (!keyJump_held && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (grounded && vsp > 0)
	    jumpstop = 0
 
	if ((sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk) && keySlap_pressed)
	{
	    instance_create(x, y, obj_swordhitbox)
	    instance_create(x + (-xscale * 10), y, obj_slidecloud)
	    sprite_index = spr_knightpep_attack
	    image_index = 0
	    state = 16
	    if (knightattacktype == 1)
	    {
	        movespeed = 8
	        vsp = -9
	        obj_swordhitbox.sprite_index = spr_parryhitbox
	    }
	}

	if (dir != xscale)
	{
	    dir = xscale
	    movespeed = 0
	}

	if (grounded && move != 0 && sprite_index == spr_knightpep_idle)
	    sprite_index = spr_knightpep_walk
	else if (grounded && move == 0 && sprite_index == spr_knightpep_walk)
	    sprite_index = spr_knightpep_idle
 
	if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk))
	{
	    snd_play(sfx_jump)
	    image_index = 0
	    sprite_index = spr_knightpep_jumpstart
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jumpstart)
	{
	    vsp = -11
	    if keyRight_held
	        hsp = 4
	    if (-keyLeft_held)
	        hsp = -4
	    sprite_index = spr_knightpep_jump
	}

	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jump) || (!grounded && sprite_index != spr_knightpep_jump))
	    sprite_index = spr_knightpep_fall
	if (sprite_index == spr_knightpep_fall && grounded)
	{
	    with (obj_baddie)
	    {
	        vsp = -7
	        hsp = 0
	    }
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
	    combo = 0
	    bounce = 0
	    image_index = 0
	    freefallstart = 0
	    momemtum = 0
	    snd_play(sfx_groundpound)
	    instance_create(x, y, obj_landcloud)
	    sprite_index = spr_knightpep_land
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_land)
	    sprite_index = spr_knightpep_idle
 
	if (move != 0)
	    xscale = move
    
	if (place_meeting(x, y + 1, obj_slope) && sprite_index != spr_knightpep_thunder)
	{
	    if (place_meeting(x, y + 1, obj_sloperight))
	        xscale = -1
	    else if (place_meeting(x, y + 1, obj_slopeleft))
	        xscale = 1
	    state = 9
	    instance_create(x, y, obj_swordhitbox)
	    sprite_index = spr_knightpep_downslope
	}
     
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5
	    else if (movespeed == 6)
	        movespeed = 6
	}
	else
	    movespeed = 0
 
	if (move != 0)
	{
	    if (movespeed < 1)
	        image_speed = 0.15
	    else if (movespeed > 1 && movespeed < 4)
	        image_speed = 0.35
	    else
	        image_speed = 0.6
	}
	else
	    image_speed = 0.35
 
	if (floor(image_index) == 4 && sprite_index == spr_knightpep_start)
	    instance_create(x, y - 600, obj_thunder)
    
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_start)
	    image_speed = 0
 
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_thunder)
	    sprite_index = spr_knightpep_idle
 
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
	    instance_create(x, (y + 43), obj_cloudeffect)
 
	if (move != 0 && sprite_index == spr_knightpep_walk && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
	{
	    snd_play(sfx_step)
	    steppy = 1
	}
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
	    steppy = 0



}
