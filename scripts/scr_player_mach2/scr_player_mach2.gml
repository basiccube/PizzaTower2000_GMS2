function scr_player_mach2() {
	scr_getinput()
	if (windingAnim < 2000)
	    windingAnim += 1

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5
	move = (keyRight_held + keyLeft_held)
	crouchslideAnim = true

	if (!keyJump_held && !jumpstop && vsp < 0.5)
	{
	    vsp /= 2
	    jumpstop = true
	}
	if (grounded && vsp > 0)
	    jumpstop = false

	if (input_buffer_jump < 8 && grounded && move != -xscale && keyAttack_held)
	{
	    image_index = 0
	    sprite_index = spr_player_secondjump1
	    snd_play(sfx_jump)
	    vsp = -9
	}
	if keyJump_pressed
	    input_buffer_jump = 0

	if grounded
	{
	    if (!machpunchAnim && sprite_index != spr_player_mach && sprite_index != spr_player_machhit)
	    {
	        if (sprite_index != spr_player_machhit)
	            sprite_index = spr_player_mach
	    }
	    if machpunchAnim
	    {
	        sprite_index = spr_player_machhit
	        if (floor(image_index) == 5) 
	            machpunchAnim = false
	    }
    
	    if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 8)
	        scr_addslopemomentum(0.1)

	    if (movespeed < 12)
	        movespeed += 0.075
	    if (movespeed >= 12)
	    {
	        machhitAnim = 0
	        state = 81
	        mach2 = 100
	        flash = true
	        sprite_index = spr_player_mach3
	        instance_create(x, y, obj_jumpdust)
	    }
	}
	else
	{
	    machpunchAnim = 0
	    if (move == -xscale)
	        movespeed = 8
	}

	if (!keyAttack_held && grounded)
	{
	    snd_play(sfx_machslide)
	    sprite_index = spr_player_machslidestart
	    state = 62
	    image_index = 0
	    mach2 = 0
	}

	if (grounded && move == -xscale)
	{
	    snd_play(sfx_machslideboost)
	    sprite_index = spr_player_machslideboost
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

	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
	{
	    snd_play(sfx_bump)
	    movespeed = 0
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create(x + (10 * xscale), (y + 10), obj_bumpeffect)
	}

	if ((!grounded && scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope)) || (grounded && scr_solid(x + sign(hsp), y - 16) && !place_meeting(x + sign(hsp), y, obj_destructibles) && place_meeting(x, y + 1, obj_slope)))
	{
	    machhitAnim = 0
	    state = 8
	}

	if (!grounded && sprite_index != spr_player_secondjump2 && sprite_index != spr_player_mach2jump)
	    sprite_index = spr_player_secondjump1
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_secondjump1)
	    sprite_index = spr_player_secondjump2

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
	    sprite_index = spr_player_suplexDash
	    state = 13
	}
	image_speed = 0.65
	scr_dotaunt()



}
