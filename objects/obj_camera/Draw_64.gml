if !instance_exists(obj_player)
	exit;
	
if !obj_player.state.is(PLAYER_GAMEOVER)
{
	var invx = hud_x - 80
	var invy = hud_y + player_yoffset - 54
	if global.hud
	{
		var px = hud_x + 11
		var py = hud_y - 8 + player_yoffset
		draw_sprite_ext(spr_pizzascore, 0, px, py, 1, 1, 0, c_white, image_alpha)
		
		draw_set_font(fnt_pizzascore)
		draw_set_align(fa_left, fa_top)
		draw_set_color(c_white)
		
		var sc = string(global.collect)
		var num = string_length(sc)
		var w = string_width(sc)
		
		var xx = px - (w / 2)
		for (var i = 0; i < num; i++)
		{
			var yy = 0
			if ((i + 1) % 2 == 0)
				yy = -5
				
			draw_text(xx, py - 44 + yy, string_char_at(sc, i + 1))
			xx += w / num
		}
		
		invx = hud_x - 68
		invy = hud_y + player_yoffset + 44
	}
	else
	{
		draw_sprite_ext(peppino_sprite, -1, hud_x, hud_y + player_yoffset, 1, 1, 0, c_white, image_alpha)
		draw_sprite_ext(speedbar_sprite, speedbar_index, hud_x, hud_y + player_yoffset + 52, 1, 1, 0, c_white, image_alpha)
	}
	
	if global.key
		draw_sprite_ext(spr_key, -1, invx, invy, 1, 1, 0, c_white, image_alpha)
	draw_sprite_ext(spr_inv, -1, invx, invy, 1, 1, 0, c_white, image_alpha)
	
	draw_set_font(fnt_big)
	draw_set_align(fa_center, fa_top)
	
	if !timestop
	{
		var tx = (SCREEN_WIDTH / 2) + random_range(-1, 1)
		var ty = 50 + random_range(-1, 1)
		
		var mins = string(global.minutes)
		var secs = string(global.seconds)
		
		var str = mins + ":" + secs
		if (global.seconds < 10)
			str = mins + ":0" + secs
		
		draw_text_alt(tx, ty, str)
	}
}