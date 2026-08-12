if instance_exists(cam_target)
{
	x = cam_target.x
	y = cam_target.y
}

with (obj_camera)
{
	shake_mag = 0
	shake_mag_acc = 0
}

var cam = camera_create_view(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
view_set_camera(0, cam)
view_set_visible(0, true)