function scr_create_uparrowhitbox()
{
	var b = noone
	with (instance_create(x, y, obj_uparrow_hitbox))
	{
		instID = other.id
		b = id
	}
	
	return b;
}