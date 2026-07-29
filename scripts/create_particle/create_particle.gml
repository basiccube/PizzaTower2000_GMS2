function create_particle(argument0, argument1, argument2, argument3) {
	// create_particle(x, y, part, random_offset)

	partx = argument0
	party = argument1
	part = argument2
	random_offset = argument3

	part_depth = ds_map_find_value(global.part_depth, part)
	if (part_depth = -4)
	    part_depth = object_get_depth(object_index)
    
	part_system_depth(global.particle_system, part_depth)
	part_emitter_region(global.particle_system, global.part_emitter, x - random_offset, x + random_offset, y - random_offset, y + random_offset, ps_shape_rectangle, ps_distr_linear)
	part_emitter_burst(global.particle_system, global.part_emitter, ds_map_find_value(global.part_map, part), 1)



}
