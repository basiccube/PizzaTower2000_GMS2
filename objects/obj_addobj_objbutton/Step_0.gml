if (position_meeting(mouse_x, mouse_y, id))
{
    image_alpha = 1
    with (obj_editor)
    {
        msg = other.object
        showmsg = true
        alarm[0] = 30
    }
}
else
    image_alpha = 0.75
