function particle_set_scale(argument0, argument1, argument2) {
	// particle_set_scale(part, xscale, yscale)

	part = argument0
	xscale = argument1
	yscale = argument2

	part_type_scale(ds_map_find_value(global.part_map, part), xscale, yscale)



}
