enum main_menu_state
{
	press_start,
	main,
	level_select,
	options,
	quit,
}

state = main_menu_state.press_start
selection = 0
prev_selection = 0

menu_separation = 40
fade = 1

cursor_x = 0
cursor_y = 0
cursor_index = 0
cursor_offset = (sprite_get_width(spr_cursor) / 2) + 8

logo_x = SCREEN_WIDTH / 2
logo_y = -96
logo_target_y = (SCREEN_HEIGHT / 2) - 48

start_y = SCREEN_HEIGHT + 96
start_target_y = SCREEN_HEIGHT / 2

start_game = function()
{
	with (obj_titlecutscene)
		move = true
	
	snd_play(sfx_collecttoppin)
	instance_destroy()
}

level_select = function()
{
	get_levels()
	selection = 0
	state = main_menu_state.level_select
}

back_to_main = function()
{
	selection = prev_selection
	state = main_menu_state.main
}

goto_options = function()
{
	snd_play(sfx_enemyprojectile)
}

goto_quit = function()
{
	snd_play(sfx_enemyprojectile)
	selection = 1
	state = main_menu_state.quit
}

main_menu = [
	["START", start_game],
	["LEVEL SELECT", level_select],
	["OPTIONS", goto_options],
	["QUIT", goto_quit]
]

var main_menu_len = array_length(main_menu)
var main_menu_size = floor(main_menu_len / 2) * menu_separation

main_menu_x = SCREEN_WIDTH / 2
main_menu_y = (SCREEN_HEIGHT / 2) - main_menu_size + 16
main_menu_offset = (SCREEN_HEIGHT / 2) + main_menu_size
main_menu_logo_target = main_menu_y - 48

level_select_x = 32
level_select_y = 70
level_select_arr = []
level_select_separation = 20

get_levels = function()
{
	level_select_arr = []
	
	var file = file_find_first("levels/*.pli", fa_none)
	while (file != "")
	{
		var path = "levels/" + file
		ini_open(path)
		
		var name = ini_read_string("Level", "Name", "NO NAME")
		var rm = ini_read_string("Level", "Room", "")
		
		ini_close()
		
		if (rm != "")
			array_push(level_select_arr, [file, name, rm])
		
		file = file_find_next()
	}
	file_find_close()
}