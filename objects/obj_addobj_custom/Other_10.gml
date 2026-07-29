with (obj_editor)
{
    selectedobj = get_string("Enter object name", selectedobj)
    if (ds_list_find_index(global.objects, selectedobj) != -1)
    {
        selectedspr = global.objspr[ds_list_find_index(global.objects, selectedobj)]
        selectedvar = global.objvar[ds_list_find_index(global.objects, selectedobj)]
    }
    else
    {
        selectedspr = spr_object
        selectedvar = ""
    }
    mode = 1
}
with (obj_addobj)
    instance_destroy()
with (obj_uibar_button)
    windowopen = false
with (obj_uibar)
    active = false
