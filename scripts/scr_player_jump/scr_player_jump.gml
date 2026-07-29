function scr_player_jump() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	if (momemtum == 0)
	    hsp = (move * movespeed)
	else
	    hsp = (xscale * movespeed)
	if (move != xscale && momemtum == 1 && movespeed != 0)
	    movespeed -= 0.05
	if (movespeed == 0)
	    momemtum = 0
	if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
	{
	    movespeed = 0
	    mach2 = 0
	}
	if (move != 0 && movespeed < 7)
	    movespeed += 0.25
	if (movespeed > 7)
	    movespeed -= 0.05
	if (((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    movespeed = 0
	if (dir != xscale)
	{
	    mach2 = 0
	    dir = xscale
	    movespeed = 0
	}
	if (move == (-xscale))
	{
	    mach2 = 0
	    movespeed = 0
	    momemtum = 0
	}
	if (keyDown_pressed)
	{
	    image_index = 0
	    state = 82
	    vsp = -5
	}
	landAnim = 1
	if ((!keyJump_held) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 5
	    jumpstop = 1
	}
	if (ladderbuffer > 0)
	    ladderbuffer -= 1
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (grounded && input_buffer_jump < 8 && (!keyDown_held) && (!keyAttack_held) && vsp > 0 && (!((sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))))
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
	if (keyAttack_held && grounded && fallinganimation < 40)
	{
	    mach2 = 0
	    if (movespeed < 6)
	        movespeed = 6
	    sprite_index = spr_player_running
	    jumpAnim = 1
	    state = 60
	    image_index = 0
	}
	if (grounded && vsp > 0 && (!keyAttack_held))
	{
	    if keyAttack_held
	        landAnim = 0
	    state = 0
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    freefallstart = 0
	}
	if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
	{
	    snd_play(sfx_bump)
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
	    image_index = 0
	    state = 68
	}

	if keyJump_pressed
	    input_buffer_jump = 0
    
	if (vsp > 5) 
	    fallinganimation += 1 
	if (fallinganimation >= 40 && fallinganimation < 80)
	    sprite_index = spr_player_facestomp
	if (fallinganimation >= 80)
	    sprite_index = spr_player_freefall
 
	if (stompAnim == 0)
	{
	    if (jumpAnim == 1)
	    {
	        if (floor(image_index) == (image_number - 1))
	            jumpAnim = 0
	    }
	    if (jumpAnim == 0)
	    {
	        if (sprite_index == spr_player_airdash1)
	            sprite_index = spr_player_airdash2
	        if (sprite_index == spr_player_jump)
	            sprite_index = spr_player_fall
	        if (sprite_index == spr_player_jump2)
	            sprite_index = spr_player_fall2
	    }
	}
	if (stompAnim == 1)
	{
	    if (sprite_index == spr_player_stompprep && floor(image_index) == (image_number - 1))
	        sprite_index = spr_player_stomp
	}
	if (keyAttack_held && sprite_index != spr_player_airdash2 && sprite_index != spr_player_airdash1 && fallinganimation < 40)
	{
	    stompAnim = 0
	    sprite_index = spr_player_airdash1
	    image_index = 0
	}
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	if (keySlap_pressed && suplexmove == 0)
	{
	    snd_play(sfx_dash)
	    instance_create(x, y, obj_slaphitbox)
	    flash = true
	    suplexmove = 1
	    vsp = -4
	    movespeed = 6
	    instance_create(x, y, obj_jumpdust)
	    image_index = 0
	    sprite_index = spr_player_suplexdash
	    state = 13
	}
	scr_dotaunt()



}
