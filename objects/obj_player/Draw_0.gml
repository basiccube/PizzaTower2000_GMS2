// Draw some stuff behind the player in Butterscotch
if (global.butterscotch && global.bscotch_player_drawoverride)
{
	global.player_drawoverride = true
	for (var i = 0; i < drawOverrideLength; i++)
		player_drawoverride_draw(drawOverride[i])
	global.player_drawoverride = false
}

if flash
	gpu_set_fog(true, c_white, 0, 0)

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)

if flash
    gpu_set_fog(false, c_white, 0, 0)