if (!selected)
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
else if (selected)
{
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
    draw_rectangle_color(x - sprite_xoffset, y - sprite_yoffset, (x - sprite_xoffset) + sprite_width, (y - sprite_yoffset) + sprite_height, c_white, c_white, c_white, c_white, true)
}
