with (instance_create(x + 48, y + 80, obj_objmenu_delete))
    objid = other.obj
with (instance_create(x + 48, y + 16, obj_objmenu_pos))
    objid = other.obj
with (instance_create(x + 48, y + 48, obj_objmenu_scale))
    objid = other.obj
if (obj.objvar != "")
{
    with (instance_create(x + 48, y + 112, obj_objmenu_var))
        objid = other.obj
    sprite_index = spr_objmenu2
}
