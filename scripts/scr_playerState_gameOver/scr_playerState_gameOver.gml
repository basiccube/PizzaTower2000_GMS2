function scr_playerState_gameOver()
{
	sprite_index = spr_player_dead
	image_speed = 0.35
	
	hurt = false
	hurtTimer = 0
	flash = false
	
	for (var i = 0; i <= 7; i++)
		alarm[i] = -1
		
	x += hsp
	y += floor(vsp)
	
	if (vsp < 30)
		vsp += grav
}