scr_menu_getinput()
cursor_index += 0.35
logo_y = lerp(logo_y, logo_target_y, 0.15)

if (fade > 0)
	fade -= 0.1

switch state
{
	case main_menu_state.press_start:
		selection = 0
		start_y = lerp(start_y, start_target_y, 0.15)
		
		if keyConfirm_pressed
		{
			logo_target_y = main_menu_logo_target
			state = main_menu_state.main
		}
		break
		
	case main_menu_state.main:
		prev_selection = selection
		main_menu_offset = lerp(main_menu_offset, 0, 0.15)
		
		var move = -keyUp_pressed + keyDown_pressed
		if (move != 0)
			selection += move
		
		var len = array_length(main_menu)
		if (selection >= len)
			selection = 0
		else if (selection < 0)
			selection = len - 1
			
		if (prev_selection != selection)
			snd_play(sfx_step)
		
		if keyConfirm_pressed
		{
			main_menu_offset = 0
			main_menu[selection][1]()
		}
		break
		
	case main_menu_state.quit:
		var prev = selection
		
		var move = keyLeft_pressed + keyRight_pressed
		if (move != 0)
			selection += move
		selection = clamp(selection, 0, 1)
		
		if (prev != selection)
			snd_play(sfx_step)
		
		if keyConfirm_pressed
		{
			if (selection > 0)
				back_to_main()
			else
				game_end()
		}
		break
		
	case main_menu_state.level_select:
		var prev = selection
		
		var move = -keyUp_pressed + keyDown_pressed
		if (move != 0)
			selection += move
		
		var len = array_length(level_select_arr)
		if (selection >= len)
			selection = 0
		else if (selection < 0)
			selection = len - 1
			
		if (prev != selection)
			snd_play(sfx_step)
		
		if keyConfirm_pressed
		{
			var level = level_select_arr[selection]
			var rm = undefined
			with (obj_room)
				rm = variable_instance_get(id, level[2])
				
			with (obj_player)
			{
				targetDoor = "A"
				targetRoom = rm
				state.change(PLAYER_NORMAL)
			}
			
			var file = level[0]
			global.leveltosave = filename_change_ext(file, "")
			
			var path = "levels/" + file
			if file_exists(path)
			{
				ini_open(path)
				level_set_srank(ini_read_real("Level", "SRank", 0))
				ini_close()
			}
			
			instance_create(x, y, obj_transition)
			instance_destroy()
		}
		else if keyBack_pressed
			back_to_main()
		break
}