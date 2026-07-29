for (i = 0; i < abs(image_yscale); i += 1)
    draw_sprite(sprite_index, image_index, x, (y + ((32 * i) * sign(image_yscale))))
