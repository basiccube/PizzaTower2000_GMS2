with (objid)
{
    image_xscale = get_integer("Set new x scale", image_xscale)
    image_yscale = get_integer("Set new y scale", image_yscale)
}
with (obj_objmenu)
    instance_destroy()
