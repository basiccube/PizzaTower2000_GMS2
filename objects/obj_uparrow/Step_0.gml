image_speed = 0.35
with (obj_player)
{
    if (((!(place_meeting(x, y, obj_door))) && (!(place_meeting(x, y, obj_keydoor))) && (!(place_meeting(x, y, obj_startgate))) && (!(place_meeting(x, y, obj_roomdoor))) && (!(place_meeting(x, y, obj_exitgate)))) || (!(scr_solid(x, (y + 1)))) || state != 0)
    {
        with (other)
            instance_destroy()
    }
}
x = obj_player.x
y = (obj_player.y - 50)
