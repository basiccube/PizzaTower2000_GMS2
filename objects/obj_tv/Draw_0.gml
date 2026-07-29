tv_x = (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 98)
tv_y = (__view_get( e__VW.YView, 0 ) + 70)

draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_text(__view_get( e__VW.XView, 0 ) + xi, __view_get( e__VW.YView, 0 ) + yi, string_hash_to_newline(message))

if (global.hud)
{
    draw_sprite_ext(spr_newtv_bg, 0, tv_x - 17, tv_y + 10 + player_yoffset, 1, 1, 0, c_white, 1)
    draw_sprite_ext(sprite_index, image_index, tv_x - 17, tv_y + 10 + player_yoffset, 1, 1, 0, c_white, 1)
    if (comboalpha > 0)
    {
        draw_sprite_ext(spr_newtv_darkened, 0, tv_x - 17, tv_y + 10 + player_yoffset, 1, 1, 0, c_white, 0.45 * comboalpha)
        draw_sprite_ext(spr_newtv_combo, 0, tv_x - 17, tv_y + 12 + player_yoffset, 1, 1, 0, c_white, comboalpha)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_font(global.combofont)
        draw_set_alpha(comboalpha)
        
        var combostr, num, w, xx, yy;
        combostr = string(savedcombo)
        if (savedcombo < 10)
            combostr = "0" + combostr
            
        num = string_length(combostr)
        w = string_width(string_hash_to_newline(combostr)) / num
        xx = 0
        yy = 0
        
        for (i = 0; i < num; i += 1)
        {
            xx = (i * w) - 42
            yy = (i * 5) + 16
            draw_text(tv_x - 17 + xx, tv_y + 12 - yy + player_yoffset, string_hash_to_newline(string_char_at(combostr, i + 1)))
        }
        draw_set_alpha(1)
        
        draw_sprite_ext(spr_barpop, 2, tv_x - 66, tv_y + 58 + player_yoffset, 1, 1, 0, c_white, comboalpha)
    
        var b, bw, bh;
        b = global.combotime / 55
        bw = sprite_get_width(spr_barpop)
        bh = sprite_get_height(spr_barpop)
        draw_sprite_part_ext(spr_barpop, 1, 0, 0, bw * b, bh, tv_x - 66, tv_y + 58 + player_yoffset, 1, 1, c_white, comboalpha)
    
        draw_sprite_ext(spr_barpop, 0, tv_x - 66, tv_y + 58 + player_yoffset, 1, 1, 0, c_white, comboalpha)
    }
}
else
{
    draw_sprite_ext(tvsprite, -1, tv_x, tv_y + player_yoffset, 1, 1, 0, c_white, 1)
    
    if (tvsprite == spr_tvdefault)
    {
        draw_text(tv_x - 4, tv_y + player_yoffset - 14, string_hash_to_newline(global.collect))
    
        if (global.combo != 0 && global.combotime > 0)
        {
            draw_set_font(global.smallfont)
            draw_text(tv_x - 4, tv_y + player_yoffset + 18, string_hash_to_newline("X" + string(global.combo)))
            draw_sprite_ext(spr_barpop_old, 0, tv_x - 32, tv_y + 36 + player_yoffset, 1, 1, 0, c_white, 1)
    
            var b, bw, bh;
            b = global.combotime / 55
            bw = sprite_get_width(spr_barpop_old)
            bh = sprite_get_height(spr_barpop_old)
            draw_sprite_part_ext(spr_barpop_old, 1, 0, 0, bw * b, bh, tv_x - 32, tv_y + 36 + player_yoffset, 1, 1, c_white, 1)
        }
    }
}

draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_valign(fa_top)

if (instance_exists(obj_pizzaball))
    draw_text(tv_x - 14, tv_y + 180, string_hash_to_newline(string(global.golfhit) + " GOLF HIT"))
