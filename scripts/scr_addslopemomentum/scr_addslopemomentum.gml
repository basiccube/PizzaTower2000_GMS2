function scr_addslopemomentum(spd)
{
	with (instance_place(x, y + 1, obj_slope))
	{
		slopescale = 1
		if (object_index == obj_slopeleft)
			slopescale = -1
		
		if (slopescale == -sign(other.xscale))
			other.movespeed += spd
		else
			other.movespeed -= spd
	}
}