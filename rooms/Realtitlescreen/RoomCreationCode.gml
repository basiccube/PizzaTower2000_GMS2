var lay = layer_get_id("Background_Ground")
layer_y(lay, global.screenh - 120)

with (obj_rockcutscene)
{
	x = global.screenw + 20
	y = global.screenh - 138
}

with (obj_titlecutscene)
{
	x = (global.screenw / 2) - 96
	y = global.screenh - 138
}

with (obj_controls)
	x = global.screenw - 128