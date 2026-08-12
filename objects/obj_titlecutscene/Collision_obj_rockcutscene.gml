if (other.sprite_index == spr_scooterrock)
{
    snd_play(sfx_pephurt)
    instance_create(x, y, obj_bangeffect)
	sprite_index = spr_player_machFreefall
    
	hsp = 8
	vsp = -20
	drop = true
	
	other.sprite_index = spr_pepcooter_rock
}
