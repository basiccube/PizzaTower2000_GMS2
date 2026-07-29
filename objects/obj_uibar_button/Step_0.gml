if (!obj_uibar.active)
    instance_destroy()

if (position_meeting(mouse_x, mouse_y, id) && !windowopen)
    image_alpha = 1
else
    image_alpha = 0.5