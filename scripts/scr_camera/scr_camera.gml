function camera_shake(shake, shake_acc)
{
	with (obj_camera)
	{
		shake_mag = shake
		shake_mag_acc = shake_acc / room_speed
	}
}

function camera_init()
{
	var oldcam = view_get_camera(0)
	if (oldcam != -1)
		camera_destroy(oldcam)
	
	var cam = camera_create_view(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	view_set_camera(0, cam)
	view_set_visible(0, true)
}