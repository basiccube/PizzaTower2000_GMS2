if !visible
	exit;

var arr = [
	[bg, 0.25],
	[bg2, 0.15],
	[bg3, 0.05]
]

for (var i = 0, n = array_length(arr); i < n; i++)
{
	var b = arr[i]
	if (b[0] == -1)
		b[0] = bg_sky2
	if (b[0] == bg_null)
		continue;
	
	draw_sprite_tiled(b[0], 0, CAM_X * b[1], CAM_Y * b[1])
}