draw_set_font(fnt_big)
draw_set_align(fa_center, fa_top)
draw_set_color(c_white)
draw_text(xi, yi, message)

if global.hud
{
	var tx = tv_x - 17
	var ty = tv_y + 10 + player_yoffset
	
	draw_sprite_ext(spr_newtv_bg, 0, tx, ty, 1, 1, 0, c_white, 1)
	draw_sprite_ext(sprite_index, image_index, tx, ty, 1, 1, 0, c_white, 1)
	
	if (sprite_index != spr_newtv_open)
		draw_sprite_ext(spr_newtv_empty, 0, tx, ty, 1, 1, 0, c_white, 1)
	
	if (comboalpha > 0)
	{
		draw_sprite_ext(spr_newtv_darkened, 0, tx, ty, 1, 1, 0, c_white, 0.45 * comboalpha)
		draw_sprite_ext(spr_newtv_combo, 0, tx, ty + 2, 1, 1, 0, c_white, comboalpha)
		
		draw_set_font(fnt_combo)
		draw_set_align(fa_left, fa_top)
		draw_set_alpha(comboalpha)
		
		var combostr = string(savedcombo)
		if (savedcombo < 10)
			combostr = "0" + combostr
			
		var num = string_length(combostr)
		var w = string_width(combostr) / num
		
		for (var i = 0; i < num; i++)
		{
			var xx = (i * w) - 42
			var yy = (i * 5) + 16
			draw_text(tx + xx, ty + 2 - yy, string_char_at(combostr, i + 1))
		}
		
		var cx = tx - 49
		var cy = ty + 48
		
		draw_set_alpha(1)
		draw_sprite_ext(spr_barpop, 2, cx, cy, 1, 1, 0, c_white, comboalpha)
		
		var b = global.combotime / 55
		var bw = sprite_get_width(spr_barpop)
		var bh = sprite_get_height(spr_barpop)
		
		draw_sprite_part_ext(spr_barpop, 1, 0, 0, bw * b, bh, cx, cy, 1, 1, c_white, comboalpha)
		draw_sprite_ext(spr_barpop, 0, cx, cy, 1, 1, 0, c_white, comboalpha)
	}
}
else
{
	var tx = tv_x
	var ty = tv_y + player_yoffset
	
	if (tvsprite != spr_tvdefault)
		draw_sprite_ext(spr_tvdefault, 0, tx, ty, 1, 1, 0, c_white, 1)
	
	draw_sprite_ext(tvsprite, -1, tx, ty, 1, 1, 0, c_white, 1)
	if (tvsprite == spr_tvdefault)
	{
		draw_text(tx - 4, ty - 14, string(global.collect))
		if (global.combo != 0 && global.combotime > 0)
		{
			draw_set_font(fnt_small)
			draw_text(tx - 4, ty + 18, "X" + string(global.combo))
			
			var cx = tx - 32
			var cy = ty + 36
			
			draw_sprite_ext(spr_barpop_old, 0, cx, cy, 1, 1, 0, c_white, 1)
			
			var b = global.combotime / 55
			var bw = sprite_get_width(spr_barpop_old)
			var bh = sprite_get_height(spr_barpop_old)
			
			draw_sprite_part_ext(spr_barpop_old, 1, 0, 0, bw * b, bh, cx, cy, 1, 1, c_white, 1)
		}
	}
}

draw_set_font(fnt_big)
draw_set_align(fa_center, fa_top)

if instance_exists(obj_pizzaball)
	draw_text(tv_x - 14, tv_y + 180, string(global.golfhit) + " GOLF HIT")