if !variable_global_exists("launcher_room")
{
	global.launcher_room = undefined
	global.screenw = 640
	global.screenh = 480
}

window_set_min_width(room_width)
window_set_min_height(room_height)
window_set_max_width(room_width)
window_set_max_height(room_height)

load_room = function(rm)
{
	if (global.launcher_room == undefined)
	{
		with (windowSizeListBox)
			executeSelected()
	}
		
	var w = global.screenw
	var h = global.screenh
	
	if (rm == rm_editor)
	{
		w = 800
		h = 544
	}
	
	surface_resize(application_surface, w, h)
	display_set_gui_size(w, h)
	
	var mw = w
	var mh = h
	if (rm == rm_editor)
	{
		mw = -1
		mh = -1
	}
	
	window_set_min_width(mw)
	window_set_min_height(mh)
	window_set_max_width(mw)
	window_set_max_height(mh)
	
	window_set_size(w, h)
	window_center()
	
	global.launcher_room = rm
	room_goto(rm)
}

for (var i = 0, n = parameter_count(); i < n; i++)
{
	var p = parameter_string(i)
	if (p == "-editor" || p == "editor")
		load_room(rm_editor)
}