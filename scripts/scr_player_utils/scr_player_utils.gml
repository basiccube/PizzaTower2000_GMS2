function scr_player_taunt()
{
	if keyTaunt_pressed
	{
		tauntStoredMovespeed = movespeed
		tauntStoredSprite = sprite_index
		tauntStoredState = state.state
		
		tauntTimer = 20
		state.change(PLAYER_TAUNT)
		
		sprite_index = spr_player_taunt
		image_index = irandom(11)
		
		snd_play(sfx_taunt)
		instance_create(x, y, obj_taunteffect)
	}
}

function scr_player_railspeed()
{
	if place_meeting(x, y + 1, obj_railh)
		hsp -= 5
	else if place_meeting(x, y + 1, obj_railh2)
		hsp += 5
}

function scr_player_addslopemomentum(spd)
{
	if !place_meeting(x, y + 1, obj_slope)
		exit;
	
	var inst = instance_place(x, y + 1, obj_slope)
	var scale = 1
	if (inst.object_index == obj_slopeleft)
		scale = -1
	
	if (scale == -sign(xscale))
		movespeed += spd
	else
		movespeed -= spd
}

global.player_drawoverride = false
#macro PLAYER_DRAWOVERRIDE !(global.butterscotch && global.bscotch_player_drawoverride && !global.player_drawoverride)

function player_drawoverride_draw(obj)
{ with (obj) event_perform(ev_draw, ev_draw_normal); }