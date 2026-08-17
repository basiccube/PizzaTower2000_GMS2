function scr_enemy_grabbed()
{
	var player = obj_player
	if !instance_exists(player)
	{
		state = ENEMY_STUN
		exit;
	}
	
	player.grabbedID = id
	image_xscale = -player.xscale
	
	hsp = 0
	stunned = 200
	
	var validStates = [PLAYER_GRAB, PLAYER_PILEDRIVER, PLAYER_CHARGE, PLAYER_ANIMATION]
	if player.state.is(PLAYER_GRAB)
	{
		x = player.x
		y = player.y - 50
		
		with (player)
		{
			if (grounded && keyDown_held)
			{
				state.change(PLAYER_NORMAL)
				with (other)
				{
					vsp = -2
					state = ENEMY_STUN
				}
			}
		}
	}
	else if player.state.is(PLAYER_CHARGE)
	{
		x = player.x + (20 * player.xscale)
		y = player.y
	}
	else
	{
		x = player.x + (15 * player.xscale)
		y = player.y
	}
	
	if !player.state.is(validStates)
	{
		x = player.x
		y = player.y
		state = ENEMY_STUN
		image_index = 0
	}
	
	if (player.state.is(PLAYER_ANIMATION) && (player.sprite_index == spr_player_punch || player.sprite_index == spr_player_punchUp))
		scr_enemy_doThrow(player)
	else if (player.state.is(PLAYER_CHARGE) && scr_solid(x + player.xscale, y))
		scr_enemy_doThrow(player)
	else if player.state.is(PLAYER_PILEDRIVER)
	{
		if player.piledriverAnim
		{
			var off = 0
			switch floor(player.image_index)
			{
				case 0:
					off = 10
					depth = 0
					break
				case 1:
					off = 5
					depth = 0
					break
				case 2:
					depth = 0
					break
				case 3:
					off = -5
					depth = 0
					break
				case 4:
					off = -10
					depth = 0
					break
				case 5:
					off = -5
					depth = -7
					break
				case 6:
					depth = -7
					break
				case 7:
					off = 5
					depth = -7
					break
			}
			
			x = player.x + (off * player.xscale)
			y = player.y
		}
		else
		{
			x = player.x - player.piledriverX
			y = player.y - player.piledriverY
			depth = 0
		}
		
		if (player.sprite_index == spr_player_piledriverLand)
		{
			snd_play(sfx_punch)
			scr_enemy_doThrow(player)
		}
	}
	
	sprite_index = grabbedspr
	image_speed = 0.35
}

function scr_enemy_doThrow(player)
{
	var spr = player.sprite_index
	if (spr != spr_player_piledriverLand)
	{
		var bx = x + (15 * -player.xscale)
		var by = y - 50
		if (spr == spr_player_punch)
		{
			bx = x + (30 * player.xscale)
			by = y
		}
		instance_create(bx, by, obj_bumpeffect)
	}
	
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	
	flash = true
	alarm[1] = 5
	if (spr != spr_player_piledriverLand)
		camera_shake(3, 3)
	
	global.combotime = 60
	global.style += 5
	if (object_index == obj_pizzaball)
		global.golfhit++
	
	thrown = true
	state = ENEMY_STUN
	
	x = player.x
	y = player.y
	
	switch spr
	{
		case spr_player_punchUp:
			hsp = 2 * -image_xscale
			vsp = -20
			break
			
		case spr_player_charge:
			hsp = 4 * -image_xscale
			vsp = -4
			break
			
		case spr_player_piledriverLand:
			hsp = 10 * -image_xscale
			vsp = -10
			break
			
		default:
			hsp = 25 * -image_xscale
			vsp = -1
			grav = 0
	}
}