if (alpha >= 1 && fadein == 0)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        if (room != obj_player.targetRoom)
            room_goto(obj_player.targetRoom)
    }
    else
        room_goto(gotonoplayer)
}
 
if (fadein == 0)
    alpha += 0.1
else if (fadein == 1)
    alpha -= 0.1
 
if instance_exists(obj_player)
{
    with (obj_player)
    {
        if (other.fadein == 1 && (obj_player.state == 69 || obj_player.state == 55) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
        {
            state = 52
            image_index = 0
        }
    }
}

if (fadein == 1 && alpha <= 0)
    instance_destroy()
