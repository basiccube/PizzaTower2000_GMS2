if (!obj_uibar.active && !instance_exists(obj_objmenu))
{
    if (gridsize == 32)
    {
        sprite_index = spr_cursor32
        gridmovex = mouse_x - 16
        gridmovey = mouse_y - 16
    }
    else if (gridsize == 28)
    {
        sprite_index = spr_cursor28
        gridmovex = mouse_x - 14
        gridmovey = mouse_y - 14
    }
    else if (gridsize == 24)
    {
        sprite_index = spr_cursor24
        gridmovex = mouse_x - 12
        gridmovey = mouse_y - 12
    }
    else if (gridsize == 20)
    {
        sprite_index = spr_cursor20
        gridmovex = mouse_x - 10
        gridmovey = mouse_y - 10
    }
    else if (gridsize == 16)
    {
        sprite_index = spr_cursor16
        gridmovex = mouse_x - 8
        gridmovey = mouse_y - 8
    }
    else if (gridsize == 12)
    {
        sprite_index = spr_cursor12
        gridmovex = mouse_x - 6
        gridmovey = mouse_y - 6
    }
    else if (gridsize == 8)
    {
        sprite_index = spr_cursor8
        gridmovex = mouse_x - 4
        gridmovey = mouse_y - 4
    }
    else if (gridsize == 4)
    {
        sprite_index = spr_cursor4
        gridmovex = mouse_x - 2
        gridmovey = mouse_y - 2
    }
    
    x = gridmovex
    y = gridmovey
    move_snap(gridsize, gridsize)
    gridsize = clamp(gridsize, 4, 32)
    
    if (uibuffer > 0)
        uibuffer -= 1
    if (place_meeting(x, y, obj_object))
        image_alpha = 0.5
    else
        image_alpha = 1
    
    if (mode == 4 && !instance_exists(obj_tileui))
        instance_create(x, y, obj_tileui)
    
    if (uibuffer <= 0)
    {
        if (keyboard_check_pressed(vk_pagedown))
        {
            if (gridsize > 4)
                gridsize -= 4
            msg = "Grid size: " + string(gridsize)
            showmsg = true
            alarm[0] = 60
        }
        if (keyboard_check_pressed(vk_pageup))
        {
            if (gridsize < 32)
                gridsize += 4
            msg = "Grid size: " + string(gridsize)
            showmsg = true
            alarm[0] = 60
        }
        
        // Tile mode
        //if (mode == 4 && mouse_check_button(mb_left) && tile_get_at(x, y) == -1 && !position_meeting(mouse_x, mouse_y, obj_tileui_tilearea))
        //   (selectedtileset, obj_tileui_tilearea.tilex, obj_tileui_tilearea.tiley, 32, 32, x, y, -5)
        if (mode == 4 && mouse_check_button(mb_right) && !position_meeting(mouse_x, mouse_y, obj_tileui_tilearea))
            tile_delete(x, y)
        
        // Object placement mode
        if (mode == 1 && mouse_check_button_pressed(mb_left))
        {
            with (instance_create(x, y, obj_object))
            {
                object = other.selectedobj
                sprite_index = other.selectedspr
                objvar = other.selectedvar
                objvar2 = other.selectedvar2
            }
            mode = 0
        }
    }
}

if (showmsg && msgalpha < 1)
    msgalpha += 0.1
if (!showmsg && msgalpha > 0)
    msgalpha -= 0.1
