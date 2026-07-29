with (obj_editor)
{
    selectedobj = other.object
    selectedspr = other.objspr
    selectedvar = other.objvar
    selectedvar2 = other.objvar2
    mode = 1
    uibuffer = 5
}
with (obj_addobj)
    instance_destroy()
with (obj_uibar_button)
    windowopen = false
with (obj_uibar)
    active = false
