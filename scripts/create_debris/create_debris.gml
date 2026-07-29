function create_debris(argument0, argument1, argument2, argument3) {
	// create_debris(x, y, sprite, animated)

	var xx, yy, spr, animated, debris_arr;
	xx = argument0
	yy = argument1
	spr = argument2
	animated = argument3

	// x
	debris_arr[0] = xx
	// y
	debris_arr[1] = yy
	// sprite_index
	debris_arr[2] = spr
	// image_number
	debris_arr[3] = sprite_get_number(spr)
	// image_index
	debris_arr[4] = random(debris_arr[3] - 1)
	// image_angle
	debris_arr[5] = random(270)
	// image_speed
	debris_arr[6] = 0.35
	// sprite_width
	debris_arr[7] = sprite_get_width(spr)
	// sprite_height
	debris_arr[8] = sprite_get_height(spr)
	// hsp
	debris_arr[9] = choose(-4, -3, -2, -1, 0, 1, 2, 3, 4)
	// vsp
	debris_arr[10] = choose(-4, -3, -2, -1, 0)
	// grav
	debris_arr[11] = 0.4
	// animated
	debris_arr[12] = animated

	ds_list_add(global.debris_list, debris_arr)
	return debris_arr;



}
