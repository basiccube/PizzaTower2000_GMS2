with (obj_editor)
{
    mu = ds_list_find_index(global.music, setmusic)
    if (mu > 0)
        mu -= 1
    else
        mu = ds_list_size(global.music) - 1
    setmusic = ds_list_find_value(global.music, mu)
    msg = "Room music set to " + setmusic
    showmsg = true
    alarm[0] = 60
}
