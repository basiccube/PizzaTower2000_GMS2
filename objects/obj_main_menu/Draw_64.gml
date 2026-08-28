draw_set_font(fnt_big)
draw_set_align(fa_center, fa_top)

var drawGameLogo = false
switch state
{
	case main_menu_state.press_start:
		drawGameLogo = true
		draw_text_alt(SCREEN_WIDTH / 2, start_y, "PRESS START")
		break
		
	case main_menu_state.main:
		var mx = main_menu_x
		var my = main_menu_y + main_menu_offset
		drawGameLogo = true
		
		for (var i = 0, n = array_length(main_menu); i < n; i++)
		{
			var b = main_menu[i]
			var str = b[0]
			
			var c = c_gray
			if (selection == i)
			{
				cursor_x = mx - (string_width(str) / 2) - cursor_offset
				cursor_y = my + (string_height(str) / 2)
				c = c_white
			}
			
			draw_text_alt(mx, my, str, c, 1)
			my += menu_separation
		}
		
		draw_sprite_ext(spr_cursor, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1)
		break
		
	case main_menu_state.quit:
		draw_rectangle_ext(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, 0.5)
		draw_text_alt(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 32, "QUIT GAME")
		
		var yx = (SCREEN_WIDTH / 2) - 120
		var nx = (SCREEN_WIDTH / 2) + 120
		var oy = (SCREEN_HEIGHT / 2) + 16
		
		draw_text_alt(yx, oy, "YES", selection == 0 ? c_white : c_gray)
		draw_text_alt(nx, oy, "NO", selection == 1 ? c_white : c_gray)
		break
		
	case main_menu_state.level_select:
		draw_set_halign(fa_left)
		draw_text_alt(level_select_x, level_select_y - 38, "SELECT LEVEL:")
		
		var lx = level_select_x
		var ly = level_select_y
		draw_set_font(fnt_small)
		
		for (var i = 0, n = array_length(level_select_arr); i < n; i++)
		{
			var level = level_select_arr[i]
			var name = level[1]
			
			var c = c_gray
			if (selection == i)
				c = c_white
			
			draw_text_alt(lx, ly, name, c)
			ly += level_select_separation
		}
		break
}

// game logo
if drawGameLogo
{
	var lx = logo_x
	var ly = logo_y
	var lw = sprite_get_width(spr_gameLogo)
	draw_sprite_ext(spr_gameLogo, 0, lx - (lw / 2), ly, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_gameLogo, 1, lx + (lw / 2), ly, 1, 1, 0, c_white, 1)
}

// initial fade in
if (fade > 0)
	draw_rectangle_ext(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, fade)