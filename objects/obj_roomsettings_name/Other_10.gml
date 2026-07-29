with (obj_editor)
{
    var newroomname;
    newroomname = get_string("Set room name to:", roomname)
    
    if (newroomname == "objects")
        show_message("You cannot set that as the room name.")
    else
        roomname = newroomname
}
with (obj_uibar_button)
    windowopen = false
