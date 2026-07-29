if !obj_uibar.active
{
	spd = 10
	if keyboard_check(vk_shift)
		spd = 25
	
	var cx = CAM_X
	var cy = CAM_Y
	if keyboard_check(ord("W"))
		cy -= spd
	if keyboard_check(ord("S"))
		cy += spd
	if keyboard_check(ord("A"))
		cx -= spd
	if keyboard_check(ord("D"))
		cx += spd
	
	camera_set_view_pos(view_camera[0], cx, cy)
}

var ww = window_get_width()
var wh = window_get_height()
if (ww <= 0 || wh <= 0)
	exit;

if ((room_width != ww || room_height != wh) && window_has_focus())
{
	surface_resize(application_surface, ww, wh)
	display_set_gui_size(ww, wh)
	
	view_set_wport(0, ww)
	view_set_hport(0, wh)
	camera_set_view_size(view_camera[0], ww, wh)
	
	room_width = ww
	room_height = wh
}