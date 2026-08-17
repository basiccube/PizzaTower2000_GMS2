function scr_player_destroyDestructibles()
{
	if state.is([PLAYER_MACH2, PLAYER_MACH3, PLAYER_MACHROLL, PLAYER_TUMBLE, PLAYER_CROUCHSLIDE, PLAYER_CHARGE])
	{
		var machhit = false
		var checks = [
			[x + hsp, y],
			[x + (hsp * 2), y],
			[x + (hsp * 2), y - 1],
			[x + (hsp * 2), y + 1]
		]
		
		for (var i = 0, n = array_length(checks); i < n; i++)
		{
			var c = checks[i]
			if place_meeting(c[0], c[1], obj_destructibles)
			{
				instance_destroy(instance_place(c[0], c[1], obj_destructibles))
				machhit = true
			}
		}
		
		if (machhit && state.is(PLAYER_MACH2) && !machhitAnim)
		{
			machhitAnim = true
			image_index = 0
		}
	}
	
	if state.is([PLAYER_JUMP, PLAYER_MACH2, PLAYER_MACH3, PLAYER_WALLCLIMB, PLAYER_SUPERJUMP])
	{
		if place_meeting(x, y - 1, obj_destructibles)
			instance_destroy(instance_place(x, y - 1, obj_destructibles))
	}
	
	if state.is(PLAYER_PILEDRIVER)
	{
		if place_meeting(x, y + 1, obj_destructibles)
			instance_destroy(instance_place(x, y + 1, obj_destructibles))
	}
	
	if state.is([PLAYER_FREEFALL, PLAYER_FREEFALLLAND])
	{
		if place_meeting(x, y + vsp + 2, obj_destructibles)
			instance_destroy(instance_place(x, y + vsp + 2, obj_destructibles))
	}
	
	if state.is(PLAYER_SUPLEXDASH)
	{
		var num = instance_place_list(x + (hsp * 2), y, obj_destructibles, tempMeetingList, false)
		for (var i = 0; i < num; i++)
		{
			var inst = ds_list_find_value(tempMeetingList, i)
			if place_meeting(x + (hsp * 2), y, obj_bigdestructibles)
			{
				sprite_index = choose(
					spr_player_suplexMash1,
					spr_player_suplexMash2,
					spr_player_suplexMash3,
					spr_player_suplexMash4
				)
				image_index = 0
				
				state.change(PLAYER_ANIMATION)
				animSlowDown = true
				
				movespeed = -4
				vsp = -4
			}
			
			instance_destroy(inst.id)
		}
		ds_list_clear(tempMeetingList)
	}
	
	with (obj_baddie)
	{
		if !thrown
			continue;
		
		if place_meeting(x + (hsp * 2), y, obj_destructibles)
		{
			with (instance_place(x + (hsp * 2), y, obj_destructibles))
			{
				if (object_index != obj_onewayblock && object_index != obj_onewayblock_escape)
					instance_destroy()
			}
		}
		if place_meeting(x, y + (vsp * 2), obj_destructibles)
		{
			with (instance_place(x, y + (vsp * 2), obj_destructibles))
			{
				if (object_index != obj_onewayblock && object_index != obj_onewayblock_escape)
					instance_destroy()
			}
		}
	}
}