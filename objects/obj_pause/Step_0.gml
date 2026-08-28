scr_getinput()
if (keyEscape && !instance_exists(obj_transition) && !in_array(room, disabled_rooms))
{
	if (global.startRoom != "")
		game_end()
	
	if pause
		unpauseGame()
	else
	{
		menu = ["resume", "main_menu"]
		selection = 0
		
		if (!pause && room_name() != "hub_1" && room != rm_tower_outside)
			array_insert(menu, 1, "exit_level")
		
		scr_delete_pause_image()
		scr_create_pause_image()
		
		pauseGame()
	}
}

if pause
{
	menuY = lerp(menuY, menuEndY, 0.25)
	pausedY = lerp(pausedY, pausedEndY, 0.25)
	if (alpha < 1)
		alpha += 0.1
	
	var prevselection = selection
	var move = (-keyUp_pressed + keyDown_pressed)
	if (move != 0)
		selection += move
	
	var len = array_length(menu)
	if (selection >= len)
		selection = 0
	else if (selection < 0)
		selection = len - 1
	
	if (prevselection != selection)
		snd_play(sfx_step)
	
	if keyJump_pressed
	{
		var func = ds_map_find_value(menu_map, menu[selection])
		if (func != undefined)
			func()
	}
}
else
{
	menuY = lerp(menuY, menuStartY, 0.25)
	pausedY = lerp(pausedY, pausedStartY, 0.25)
	if (alpha > 0)
		alpha -= 0.1
}