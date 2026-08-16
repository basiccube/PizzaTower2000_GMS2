if (state == ENEMY_GRABBED)
	exit;

var pizzaball = (object_index == obj_pizzaball)
if (hp > 0 && !pizzaball)
{
	snd_play(sfx_bump)
	if (hp > 0)
		hp--
	
	instance_create(x, y, obj_bumpeffect)
	instance_create(x, y, obj_bangeffect)
	with (instance_create(x, y, obj_spikehurteffect))
		image_xscale = other.image_xscale
		
	state = ENEMY_STUN
	stunned = 150
	
	if pizzaball
		global.golfhit++
		
	if (other.x != x)
		image_xscale = -sign(x - other.x)
	instance_destroy(other.id)
	
	hsp = -image_xscale * 3
	vsp = -4
	if obj_player.keyUp_held
	{
		hsp = -image_xscale * 1
		vsp = -16
	}
	
	with (obj_player)
	{
		hsp = 0
		vsp = -3
		movespeed = 0
		
		sprite_index = choose(
			spr_player_suplexmash1,
			spr_player_suplexmash2,
			spr_player_suplexmash3,
			spr_player_suplexmash4
		)
		image_index = 0
		
		state.change(PLAYER_ANIMATION)
	}
}
else if (hp <= 0 || pizzaball)
{
	snd_play(sfx_bump)
	instance_create(x + (obj_player.xscale * 40), y, obj_punchdust)
	
	state = ENEMY_GRABBED
	instance_destroy(other.id)
	
	with (obj_player)
	{
		hsp = 0
		movespeed = 0
		sprite_index = spr_player_haulingidle
		
		grabbedID = other.id
		state.change(PLAYER_GRAB)
	}
}