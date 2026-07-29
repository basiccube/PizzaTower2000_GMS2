if (keyboard_check_pressed(vk_escape) && !windowopen)
{
    active = !active
    if (active)
    {
        instance_create(startx + 4, starty + 2, obj_ui_new)
        instance_create(startx + 24, starty + 2, obj_ui_open)
        instance_create(startx + 56, starty + 2, obj_ui_save)
        instance_create(startx + 76, starty + 2, obj_ui_export)
        instance_create(startx + 96, starty + 2, obj_ui_play)
        instance_create(startx + 128, starty + 2, obj_ui_addobj)
        instance_create(startx + 148, starty + 2, obj_ui_roomsettings)
        instance_create(startx + 180, starty + 2, obj_ui_background)
        instance_create(startx + 200, starty + 2, obj_ui_tiles)
        instance_create(startx + 232, starty + 2, obj_ui_gridminus)
        instance_create(startx + 252, starty + 2, obj_ui_gridreset)
        instance_create(startx + 272, starty + 2, obj_ui_gridplus)
        instance_create(startx + 304, starty + 2, obj_ui_regularmode)
        instance_create(startx + 324, starty + 2, obj_ui_movemode)
        instance_create(startx + 344, starty + 2, obj_ui_scalemode)
        instance_create(startx + 376, starty + 2, obj_ui_toggletiles)
        instance_create(endx - 20, starty + 2, obj_ui_exit)
    }
}

if (instance_exists(obj_quitdialog) || instance_exists(obj_addobj) || instance_exists(obj_objmenu) || instance_exists(obj_roomsettings) || instance_exists(obj_newroom))
    windowopen = true
else
    windowopen = false

startx = __view_get( e__VW.XView, 0 )
starty = __view_get( e__VW.YView, 0 )
endx = __view_get( e__VW.XView, 0 ) + window_get_width()
endy = __view_get( e__VW.YView, 0 ) + 24
