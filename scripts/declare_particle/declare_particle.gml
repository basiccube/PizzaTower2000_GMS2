function declare_particle(argument0, argument1, argument2, argument3) {
	// declare_particle(part_name, part_sprite, img_speed, part_depth)

	part_name = argument0
	part_sprite = argument1
	img_speed = argument2
	part_depth = argument3

	ds_map_replace(global.part_map, part_name, part_type_create())
	ds_map_replace(global.part_depth, part_name, part_depth)

	p = ds_map_find_value(global.part_map, part_name)
	part_type_sprite(p, part_sprite, true, true, false)

	spd = sprite_get_number(part_sprite) / img_speed
	part_type_life(p, spd, spd)

	return p;



}
