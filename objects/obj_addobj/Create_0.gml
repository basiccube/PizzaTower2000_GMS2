ii = -1
iii = 0
for (i = 0; i < ds_list_size(global.objects); i += 1)
{
    ii += 1
    if (ii > 7)
    {
        ii = 0
        iii += 1
    }
    with (instance_create(__view_get( e__VW.XView, 0 ) + 24 + (32 * ii), __view_get( e__VW.YView, 0 ) + 64 + (32 * iii), obj_addobj_objbutton))
    {
        object = ds_list_find_value(global.objects, other.i)
        if (global.objbuttonspr[other.i] != -1)
            buttonspr = global.objbuttonspr[other.i]
        else
            buttonspr = global.objspr[other.i]
        objspr = global.objspr[other.i]
        if (is_string(global.objvar[other.i]))
            objvar = global.objvar[other.i]
        else
            objvar = ""
        if (is_string(global.objvar2[other.i]))
            objvar2 = global.objvar2[other.i]
        else
            objvar2 = ""
    }
}
instance_create(__view_get( e__VW.XView, 0 ) + 56, __view_get( e__VW.YView, 0 ) + 356, obj_addobj_custom)
instance_create(__view_get( e__VW.XView, 0 ) + 208, __view_get( e__VW.YView, 0 ) + 356, obj_addobj_close)
