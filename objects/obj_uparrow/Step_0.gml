x = obj_player.x
y = obj_player.y - 50
image_speed = 0.35

with (obj_player)
{
	if (!place_meeting(x, y, obj_uparrow_hitbox) || !grounded || !state.is(PLAYER_NORMAL))
		instance_destroy(other.id)
}