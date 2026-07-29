function scr_player_mach3() {
	scr_getinput()
	if (windingAnim < 2000)
	    windingAnim += 1
 
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5
 
	mach2 = 100
	momemtum = 1
	move = (keyRight_held + keyLeft_held)

	if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 12 && movespeed < 18)
	    scr_addslopemomentum(0.2)

	if (movespeed < 18 && move == xscale)
	    movespeed += 0.05
	else if (movespeed > 12 && move != xscale)
	    movespeed -= 0.05
    
	crouchslideAnim = 1
	if (!keyJump_held && !jumpstop && vsp < 0.5)
	{
	    vsp /= 2
	    jumpstop = true
	}
	if (grounded && vsp > 0)
	    jumpstop = false

	if (grounded || floor(image_index) == (image_number - 1))
	    sprite_index = spr_player_mach3    
 
	if (input_buffer_jump < 8 && grounded && move != -xscale && keyAttack_held)
	{
	    snd_play(sfx_jump)
	    sprite_index = spr_player_mach3jump
	    image_index = 0
	    vsp = -9
	}
	if keyJump_pressed
	    input_buffer_jump = 0
 
	if (keyUp_held && grounded)
	{
	    snd_play(sfx_superjumpprep)
	    snd_loop(sfx_superjumphold)
	    sprite_index = spr_player_superjumpprep
	    state = 56
	    hsp = 0
	    image_index = 0
	}

	if (!keyAttack_held && grounded)
	{
	    snd_play(sfx_machslide)
	    sprite_index = spr_player_machslidestart
	    state = 62
	    image_index = 0
	    mach2 = 0
	}
	if (move == -xscale && grounded)
	{
	    snd_play(sfx_machslideboost)
	    sprite_index = spr_player_machslideboost3
	    flash = false
	    state = 62
	    image_index = 0
	    mach2 = 35
	}

	if (keyDown_held && !place_meeting(x, y, obj_dashpad))
	{
	    instance_create(x, y, obj_jumpdust)
	    flash = 0
	    state = 28
	    vsp = 10
	}

	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
	{
	    snd_play(sfx_bump)
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    image_speed = 0.35
	    flash = false
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	}

	if ((!grounded && scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_slope)) || (grounded && scr_solid(x + sign(hsp), y - 16) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
	{
	    machhitAnim = 0
	    state = 8
	}

	if (!instance_exists(obj_chargeeffect))
	    instance_create(x, y, obj_chargeeffect)
	if (!instance_exists(obj_superdashcloud) && grounded && !global.highperformance)
	    instance_create(x, y, obj_superdashcloud)
    
	if (keySlap_pressed && suplexmove == 0)
	{
	    snd_play(sfx_dash)
	    instance_create(x, y, obj_slaphitbox)
	    suplexmove = 1
	    if (!grounded)
	        vsp = -4
	    if (movespeed < 6)
	        movespeed = 6
	    instance_create(x, y, obj_jumpdust)
	    image_index = 0
	    sprite_index = spr_player_suplexdash
	    state = 13
	}
	image_speed = 0.4
	scr_dotaunt()



}
