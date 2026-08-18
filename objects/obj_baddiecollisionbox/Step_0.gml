if instance_exists(baddieID)
{
	x = baddieID.x
	y = baddieID.y
	image_xscale = baddieID.image_xscale
}
else
{
	instance_destroy()
	exit;
}

if (baddieID.state != ENEMY_CHARGE && baddieID.state != ENEMY_GRABBED && place_meeting(x, y, obj_player))
{
	var player = obj_player.id
	var attackState = player.state.is([
		PLAYER_MACH3,
		PLAYER_FREEFALL,
		PLAYER_SUPERJUMP,
		PLAYER_CHARGE,
		PLAYER_BOMB,
		PLAYER_KNIGHTATTACK,
		PLAYER_KNIGHTSLIDE
	])
	
	// stomp
	if (instance_exists(baddieID) && player.y < baddieID.y && player.state.is(PLAYER_JUMP) && player.vsp > 0 && player.sprite_index != spr_player_stompPrep)
	{
		snd_play(sfx_bump)
		instance_create(player.x, player.y + 50, obj_stompeffect)
		
		with (baddieID)
		{
			hsp = -image_xscale * 3
			vsp = -5
			
			state = ENEMY_STUN
			stunned = 200
			
			image_index = 0
			if (player.x != x)
				image_xscale = -sign(x - player.x)
				
			if (object_index == obj_pizzaball)
				global.golfhit++
		}
		
		with (player)
		{
			sprite_index = spr_player_stompPrep
			image_index = 0
			stompAnim = true
			vsp = keyJump_held ? -14 : -9
		}
	}
	
	// mach2/machroll hit
	if (instance_exists(baddieID) && baddieID.stunbuffer <= 0 && player.state.is([PLAYER_MACH2, PLAYER_MACHROLL]))
	{
		with (baddieID)
		{
			flash = true
			stunbuffer = 15
			
			hsp = player.xscale * 7
			vsp = -5
			
			state = ENEMY_STUN
			stunned = 200
			
			image_index = 0
			if (object_index == obj_pizzaball)
				global.golfhit++
		}
		
		with (player)
		{
			machhitAnim = true
			if (!grounded && keyJump_held && state.is(PLAYER_MACH2))
			{
				sprite_index = spr_player_machJump
				vsp = -11
			}
		}
	}
	
	// attack hit
	if (instance_exists(baddieID) && attackState && baddieID.object_index != obj_pizzaball)
	{
		if player.state.is(PLAYER_MACH3)
		{
			snd_play(sfx_punch)
			instance_create(baddieID.x + (player.xscale * 40), baddieID.y, obj_punchdust)
			
			instance_create(baddieID.x, baddieID.y, obj_slapstar)
			instance_create(baddieID.x, baddieID.y, obj_baddiegibs)
			
			instance_destroy(baddieID)
		}
		else
		{
			with (player)
			{
				machhitAnim = true
				if (!grounded && keyJump_held)
					vsp = -11
			}
			instance_destroy(baddieID)
		}
	}
}

if !instance_exists(baddieID)
	instance_destroy()