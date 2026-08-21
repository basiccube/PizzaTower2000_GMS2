if (global.butterscotch && global.bscotch_backgrounds)
	exit;

if !visible
	exit;

var drawDefaultBackground = true
for (var i = 0, n = array_length(backgrounds); i < n; i++)
{
	var bg = backgrounds[i]
	if (bg[0] == undefined)
		continue;
	
	drawDefaultBackground = false
	draw_sprite_tiled(bg[0], 0, CAM_X * bg[1], CAM_Y * bg[1])
}

if drawDefaultBackground
	draw_sprite_tiled(bg_sky2, 0, 0, 0)
else if layer_get_visible(backgroundLayer)
	layer_set_visible(backgroundLayer, false)