if (obj_editor.mode != 2 && obj_editor.mode != 3)
    selected = false
if (mouse_check_button(mb_left) && obj_editor.mode == 2 && selected && !obj_uibar.active && obj_editor.uibuffer <= 0)
{
    x = obj_editor.gridmovex
    y = obj_editor.gridmovey
    move_snap(obj_editor.gridsize, obj_editor.gridsize)
}
if (!obj_uibar.active && obj_editor.mode == 3 && selected && !instance_exists(obj_scaletoolbar))
{
    with (instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + 24, obj_scaletoolbar))
        scaleobj = other.id
}
if (obj_uibar.active && obj_editor.mode == 3 && selected && instance_exists(obj_scaletoolbar))
{
    with (obj_scaletoolbar)
        instance_destroy()
}
if (!obj_uibar.active && keyboard_check_pressed(vk_right) && obj_editor.mode == 3 && selected)
    image_xscale += 1
if (!obj_uibar.active && keyboard_check_pressed(vk_left) && obj_editor.mode == 3 && selected)
    image_xscale -= 1
if (!obj_uibar.active && keyboard_check_pressed(vk_down) && obj_editor.mode == 3 && selected)
    image_yscale += 1
if (!obj_uibar.active && keyboard_check_pressed(vk_up) && obj_editor.mode == 3 && selected)
    image_yscale -= 1
if (image_xscale == 0)
    image_xscale = 1
if (image_yscale == 0)
    image_yscale = 1
if (mouse_check_button(mb_right) && (obj_editor.mode == 2 || obj_editor.mode == 3) && selected && !obj_uibar.active)
    selected = false
