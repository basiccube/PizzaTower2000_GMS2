function scr_playerState_bomb()
{
	if (sprite_index == spr_player_bombRun || sprite_index == spr_player_bombRunEnd)
	{
		hsp = xscale * movespeed
		if (movespeed < 8)
			movespeed += 0.2
		
		if (bombTimer <= 0)
			scr_player_bombExplode()
		else if (bombTimer < 20)
			sprite_index = spr_player_bombRunEnd
	}
	else
	{
		hsp = 0
		movespeed = 0
	}
	
	landAnim = false
	if (bombTimer > 0)
		bombTimer -= 0.5
	
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 2
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = false
	
	if (input_buffer_jump > 0 && grounded && hsp != 0)
	{
		snd_play(sfx_jump)
		vsp = -9
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
		snd_play(sfx_bump)
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
		xscale *= -1
	}
	
	if (sprite_index == spr_player_bombIntro && LAST_FRAME)
		sprite_index = spr_player_bombRun
	
	if (sprite_index == spr_player_bombEnd && LAST_FRAME)
	{
		hurt = true
		hurtTimer = 60
		state.change(PLAYER_NORMAL)
	}
	
	if (movespeed < 4)
		image_speed = 0.35
	else if (movespeed < 8)
		image_speed = 0.45
	else
		image_speed = 0.6
	
	if (grounded && hsp != 0 && !instance_exists(obj_dashcloud))
		instance_create(x, y, obj_dashcloud)
}

function scr_playerState_bomb_enter()
{
	sprite_index = spr_player_bombIntro
	image_index = 0
	bombTimer = 100
}

function scr_player_bombExplode()
{
	snd_play(sfx_explode)
	instance_create(x, y, obj_bombexplosion)
	bombTimer = 0
	
	sprite_index = spr_player_bombEnd
	image_index = 0
}