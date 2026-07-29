function scr_player_mach1() {
	scr_getinput()
	dir = xscale
	move = (keyLeft_held + keyRight_held)
	landAnim = 0

	if (scr_solid(x + xscale, y) && (!place_meeting(x + xscale, y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
	    mach2 = 0
	    state = 0
	    movespeed = 0
	}

	machhitAnim = 0
	crouchslideAnim = 1

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5

	if (move == -xscale)
	{
	    momemtum = 0
	    mach2 = 0
	    movespeed = 6
	    image_index = 0
	    xscale = move
	}

	if grounded
	{
	    if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 6)
	        scr_addslopemomentum(0.1)

	    if (movespeed <= 8)
	        movespeed += 0.05
	    if (movespeed >= 8)
	    {
	        sprite_index = spr_player_mach
	        mach2 = 35
	        state = 61
	        instance_create(x, y, obj_jumpdust)
	    }
	}

	sprite_index = spr_player_running
	image_speed = 0.45

	if !grounded
	{
	    sprite_index = spr_player_airdash1
	    momemtum = 1
	    state = 49
	    jumpAnim = 0
	    image_index = 0
	}

	if (!keyAttack_held && grounded)
	{
	    state = 0
	    image_index = 0
	    mach2 = 0
	}
	if keyDown_held
	{
	    sprite_index = spr_player_crouchslip
	    state = 59
	    mach2 = 0
	}
	if (keyJump_pressed && grounded && keyAttack_held)
	{
	    sprite_index = spr_player_airdash1
	    dir = xscale
	    momemtum = 1
	    vsp = -11
	    movespeed += 2
	    state = 49
	    jumpAnim = 1
	    image_index = 0
	}

	if (!instance_exists(obj_dashcloud) && grounded && !global.highperformance)
	    instance_create(x, y, obj_dashcloud)

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
	scr_dotaunt()



}
