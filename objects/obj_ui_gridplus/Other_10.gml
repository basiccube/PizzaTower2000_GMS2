with (obj_editor)
{
    if (gridsize < 32)
        gridsize += 4
    msg = "Grid size: " + string(gridsize)
    showmsg = true
    alarm[0] = 60
}
with (obj_uibar_button)
    windowopen = false
