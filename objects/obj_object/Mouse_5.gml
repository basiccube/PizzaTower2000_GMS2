if (!obj_uibar.active && !instance_exists(obj_objmenu) && obj_editor.mode == 0)
{
    with (instance_create(mouse_x, mouse_y, obj_objmenu))
        obj = other.id
}
