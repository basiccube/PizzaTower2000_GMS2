if (obj_editor.mode != 3 || !scaleobj.selected)
    instance_destroy()
x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 ) + 24
with (obj_scaletool_left)
{
    x = __view_get( e__VW.XView, 0 ) + 16
    y = __view_get( e__VW.YView, 0 ) + 40
}
with (obj_scaletool_right)
{
    x = __view_get( e__VW.XView, 0 ) + 48
    y = __view_get( e__VW.YView, 0 ) + 40
}
with (obj_scaletool_up)
{
    x = __view_get( e__VW.XView, 0 ) + 80
    y = __view_get( e__VW.YView, 0 ) + 40
}
with (obj_scaletool_down)
{
    x = __view_get( e__VW.XView, 0 ) + 112
    y = __view_get( e__VW.YView, 0 ) + 40
}
