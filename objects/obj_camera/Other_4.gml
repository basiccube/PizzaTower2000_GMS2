x = obj_player.x
y = obj_player.y

with (obj_camera)
{
    shake_mag = 0
    shake_mag_acc = 0
}

var cam = camera_create_view(0, 0, global.screenw, global.screenh)
view_set_camera(0, cam)
view_set_visible(0, true)