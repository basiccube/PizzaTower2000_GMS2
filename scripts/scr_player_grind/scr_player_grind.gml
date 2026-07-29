function scr_player_grind() {
	scr_getinput()
	vsp = 0
	machhitAnim = 0
	crouchslideAnim = 1
	hsp = (xscale * movespeed)
	if keyJump_held
	{
	    snd_loop(sfx_dash2)
	    vsp = -6
	    state = 61
	}
	if (!(place_meeting(x, (y + 1), obj_grindrail)))
	{
	    snd_loop(sfx_dash2)
	    state = 61
	}
	sprite_index = spr_player_grind
	image_speed = 0.35
	if (!instance_exists(obj_grindeffect))
	    instance_create(x, y, obj_grindeffect)



}
