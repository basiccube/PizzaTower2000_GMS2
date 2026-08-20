///@desc Culling system

var rx1 = cam_x - 200
var rx2 = SCREEN_WIDTH + 400
var ry1 = cam_y - 200
var ry2 = SCREEN_HEIGHT + 400
instance_activate_region(rx1, ry1, rx2, ry2, true)

with (obj_baddiecollisionbox)
{
	if (x < rx1 || x > rx1 + rx2 || y < ry1 || y > ry1 + ry2)
	{
		if (instance_exists(baddieID) && !baddieID.thrown)
		{
			instance_deactivate_object(baddieID)
			instance_deactivate_object(id)
		}
	}
}

alarm[2] = 2