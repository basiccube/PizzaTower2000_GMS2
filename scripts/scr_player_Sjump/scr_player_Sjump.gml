function scr_player_Sjump() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	landAnim = 0
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	sprite_index = spr_player_superjump
	vsp -= 1

	if keyAttack_pressed
	{
	    if (move != 0)
	        xscale = move
	    mach2 = 100
	    vsp = 0
	    machhitAnim = 0
	    state = 81
	    flash = 1
	    sprite_index = spr_player_mach3
	    movespeed = 12
	}

	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	{
	    snd_play(sfx_groundpound)
	    sprite_index = spr_player_superjumpland
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
	    image_index = 0
	    state = 83
	    machhitAnim = 0
	}
	image_speed = 0.5



}
