var len = ds_list_size(particleList)
for (var i = 0; i < len; i++)
{
	var part = ds_list_find_value(particleList, i)
	if is_struct(part)
		draw_sprite_ext(part.sprite, part.index, part.x, part.y, part.xscale, part.yscale, part.angle, c_white, 1)
}