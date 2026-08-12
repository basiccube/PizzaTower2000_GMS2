if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

depth = 9000
backgrounds = []

add = function(spr, offset)
{ array_push(backgrounds, [spr, offset]); }

clear = function()
{ backgrounds = []; }

reset = function()
{
	for (var i = 0, n = array_length(backgrounds); i < n; i++)
	{
		var bg = backgrounds[i]
		bg[0] = undefined
	}
}

globalvar parallaxBackground;
parallaxBackground = id