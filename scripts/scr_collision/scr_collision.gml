function collision_init()
{
	hsp = 0
	vsp = 0
	grav = 0.5
	grounded = false
}

function scr_collide()
{
	grounded = false

	repeat abs(vsp)
	{
		if !scr_solid(x, y + sign(vsp))
			y += sign(vsp)
		else
		{
			vsp = 0
			break
		}
	}

	repeat abs(hsp)
	{
		if (scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y - 1))
			y--
      
		if (!scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y + 1) && scr_solid(x + sign(hsp), y + 2))
			y++
		
		if !scr_solid(x + sign(hsp), y)
			x += sign(hsp)
		else
		{
			hsp = 0
			break
		}
	}

	if (vsp < 20)
		vsp += grav
	
	grounded |= scr_solid(x, y + 1)
	grounded |= (!place_meeting(x, y, obj_platform) && place_meeting(x, y + 1, obj_platform))
}

function scr_solid(sx, sy)
{
	var old_x = x
	var old_y = y
	
	x = sx
	y = sy
	
	if place_meeting(x, y, obj_wall)
	{
		x = old_x
		y = old_y
		return true;
	}
	
	if (y > old_y && (bbox_bottom % 16) == 0 && !place_meeting(x, old_y, obj_platform) && place_meeting(x, y, obj_platform))
	{
		x = old_x
		y = old_y
		return true;
	}
	
	if check_slope()
	{
		x = old_x
		y = old_y
		return true;
	}
	
	x = old_x
	y = old_y
	return false;
}

function scr_solid_slope(sx, sy)
{
	var old_x = x
	var old_y = y
	
	x = sx
	y = sy
	
	if check_slope()
	{
		var slope_direction = 1
		if place_meeting(x, y, obj_slopeleft)
			slope_direction = -1
		
		if (slope_direction != xscale)
		{
			x = old_x
			y = old_y
			return true;
		}
	}
	
	x = old_x
	y = old_y
	return false;
}

function check_slope()
{
	var slope = instance_place(x, y, obj_slope)
	if slope
	{
		with (slope)
		{
			var slope_start = bbox_bottom
			var slope_end = bbox_top
			var slope_direction = 1
			var object_side = other.bbox_right
			
			if (object_index == obj_slopeleft)
			{
				slope_start = bbox_top
				slope_end = bbox_bottom
				slope_direction = -1
				object_side = other.bbox_left
			}
			
			var m = (slope_direction * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left)
			slope = slope_start - round(m * (object_side - bbox_left))
			
			if (other.bbox_bottom >= slope)
				return true;
		}
	}
	
	return false;
}