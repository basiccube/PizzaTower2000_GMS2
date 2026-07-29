with (obj_bg)
    bgcolor = draw_getpixel(__view_get( e__VW.XView, 0 ) + 8 + 160, __view_get( e__VW.YView, 0 ) + 32 + 160)
with (obj_bgsetup)
    instance_destroy()
with (obj_uibar_button)
    windowopen = false
