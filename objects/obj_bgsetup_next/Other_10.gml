with (obj_editor)
{
    bg = ds_list_find_index(global.backgrounds, roombg)
    if (bg < ds_list_size(global.backgrounds) - 1)
        bg += 1
    else
        bg = 0
    roombg = ds_list_find_value(global.backgrounds, bg)
    roombgname = ds_list_find_value(global.backgroundnames, bg)
    msg = "Background set to " + string(roombgname)
    showmsg = true
    alarm[0] = 60
}
