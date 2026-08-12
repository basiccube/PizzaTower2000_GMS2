if !instance_exists(obj_playerOLD)
	exit;

if (obj_playerOLD.state != 46)
{
    if (global.hud)
    {
        draw_sprite_ext(spr_pizzascore, 0, hud_x + 11, hud_y - 8 + player_yoffset, 1, 1, 0, c_white, image_alpha)
    
        draw_set_font(global.pizzafont)
        draw_set_valign(fa_top)
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        
        var num, w, sc, xx, yy;
        sc = string(global.collect)
        num = string_length(sc)
        w = string_width(string_hash_to_newline(sc))
        xx = (hud_x + 11) - (w / 2)
        for (i = 0; i < num; i += 1)
        {
            yy = 0
            if ((i + 1) mod 2 == 0)
                yy = -5
            draw_text(xx, hud_y - 52 + yy + player_yoffset, string_hash_to_newline(string_char_at(sc, i + 1)))
            xx += (w / num)
        }
        
        if (global.key)
            draw_sprite_ext(spr_key, -1, hud_x - 68, hud_y + player_yoffset + 44, 1, 1, 0, c_white, image_alpha)
        draw_sprite_ext(spr_inv, -1, hud_x - 68, hud_y + player_yoffset + 44, 1, 1, 0, c_white, image_alpha)
    }
    else
    {
        draw_sprite_ext(peppino_sprite, -1, hud_x, hud_y + player_yoffset, 1, 1, 0, c_white, image_alpha)
        draw_sprite_ext(speedbar_sprite, speedbar_index, hud_x, hud_y + player_yoffset + 52, 1, 1, 0, c_white, image_alpha)
        
        if (global.key)
            draw_sprite_ext(spr_key, -1, hud_x - 80, hud_y + player_yoffset - 54, 1, 1, 0, c_white, image_alpha)
        draw_sprite_ext(spr_inv, -1, hud_x - 80, hud_y + player_yoffset - 54, 1, 1, 0, c_white, image_alpha)
    }
    
    draw_set_font(global.font)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    if (timestop == 0)
    {
        if (global.seconds < 10)
            draw_text(__view_get( e__VW.XView, 0 ) + random(1) + (global.screenw / 2), __view_get( e__VW.YView, 0 ) + random(1) + 50, string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)))
        else if (global.seconds >= 10)
            draw_text(__view_get( e__VW.XView, 0 ) + random(1) + (global.screenw / 2), __view_get( e__VW.YView, 0 ) + random(1) + 50, string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)))
    }
}
