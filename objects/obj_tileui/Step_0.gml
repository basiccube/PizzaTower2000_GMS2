if (obj_editor.mode != 4 || obj_uibar.active)
    instance_destroy()
x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )
with (obj_tileui_close)
{
    x = __view_get( e__VW.XView, 0 ) + 360
    y = __view_get( e__VW.YView, 0 ) + 390
}
with (obj_tileui_prev)
{
    x = __view_get( e__VW.XView, 0 ) + 58
    y = __view_get( e__VW.YView, 0 ) + 390
}
with (obj_tileui_next)
{
    x = __view_get( e__VW.XView, 0 ) + 168
    y = __view_get( e__VW.YView, 0 ) + 390
}
