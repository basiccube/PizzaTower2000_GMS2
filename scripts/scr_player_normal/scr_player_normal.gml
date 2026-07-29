function scr_player_normal() {
	scr_getinput()
	if (dir != xscale)
	{
	    dir = xscale
	    movespeed = 2
	    facehurt = 0
	}
	mach2 = 0
	move = (keyLeft_held + keyRight_held)
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (move * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (move * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (move * movespeed) + 5
	if (machslideAnim == 0 && landAnim == 0)
	{
	    if (move == 0)
	    {
	        if (idle < 400)
	            idle += 1
	        if (idle >= 300 && floor(image_index) == (image_number - 1))
	        {
	            facehurt = 0
	            idle = 0
	            image_index = 0
	        }
	        if (idle < 300)
	        {
	            if (facehurt == 0)
	            {
	                start_running = 1
	                movespeed = 0
	                sprite_index = spr_player_idle
	            }
	            else if (facehurt == 1)
	            {
	                windingAnim = 0
	                if (sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt)
	                    sprite_index = spr_player_facehurtup
	                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facehurtup)
	                    sprite_index = spr_player_facehurt
	            }
	        }
	    }
	    if (move != 0)
	    {
	        machslideAnim = 0
	        idle = 0
	        facehurt = 0
	        sprite_index = spr_player_move
	    }
	    if (move != 0)
	        xscale = move
	}
	if (landAnim == 1)
	{
	    if (move == 0)
	    {
	        movespeed = 0
	        sprite_index = spr_player_land
	        if (floor(image_index) == (image_number - 1))
	            landAnim = 0
	    }
	    if (move != 0)
	    {
	        sprite_index = spr_player_land2
	        if (floor(image_index) == (image_number - 1))
	        {
	            landAnim = 0
	            sprite_index = spr_player_move
	            image_index = 0
	        }
	    }
	}
	if (machslideAnim == 1)
	{
	    sprite_index = spr_player_machslideend
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machslideend)
	        machslideAnim = 0
	}
	if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
	    movespeed = 0
	if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
	    movespeed = 0
	jumpstop = 0
	if (!grounded && !keyJump_pressed)
	{
	    if (move != 0)
	        sprite_index = spr_player_fall2
	    else
	        sprite_index = spr_player_fall
	    jumpAnim = 0
	    state = 49
	    image_index = 0
	}
	if (keyJump_pressed)
	    input_buffer_jump = 0
	if (grounded && input_buffer_jump < 8 && !keyDown_held && !keyAttack_held && vsp > 0)
	{
	    snd_play(sfx_jump)
	    if (move == 0)
	        sprite_index = spr_player_jump
	    if (move != 0)
	        sprite_index = spr_player_jump2
	    instance_create(x, y, obj_highjumpcloud)
	    stompAnim = 0
	    vsp = -11
	    state = 49
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    freefallstart = 0
	}
	if ((keyDown_held && grounded) || (scr_solid(x, (y - 3)) && grounded))
	{
	    state = 57
	    landAnim = 0
	    crouchAnim = 1
	    image_index = 0
	    idle = 0
	}
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5
	    else if (floor(movespeed) == 6)
	        movespeed = 6
	}
	else
	    movespeed = 0
	if (movespeed > 6)
	    movespeed -= 0.1
	momemtum = 0
	if (move != 0)
	{
	    xscale = move
	    if (movespeed < 3 && move != 0)
	        image_speed = 0.35
	    else if (movespeed > 3 && movespeed < 6)
	        image_speed = 0.45
	    else
	        image_speed = 0.6
	}
	else
	    image_speed = 0.35
	if (keyAttack_held && grounded && !place_meeting((x + xscale), y, obj_wall))
	{
	    mach2 = 0
	    if (movespeed < 6)
	        movespeed = 6
	    sprite_index = spr_player_running
	    jumpAnim = 1
	    state = 60
	    image_index = 0
	}
	if (keySlap_pressed && suplexmove == 0)
	{
	    snd_play(sfx_dash)
	    instance_create(x, y, obj_slaphitbox)
	    flash = true
	    suplexmove = 1
	    movespeed = 6
	    instance_create(x, y, obj_jumpdust)
	    image_index = 0
	    sprite_index = spr_player_suplexdash
	    state = 13
	}
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
	{
	    instance_create(x, y + 43, obj_cloudeffect)
	    snd_play(sfx_step)
	    steppy = 1
	}
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
	    steppy = 0
    
	scr_dotaunt()



}
