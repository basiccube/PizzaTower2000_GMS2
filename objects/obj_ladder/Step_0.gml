if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (place_meeting(x, (y + 1), obj_ladder) && keyDown_held && state == 57 && place_meeting(x, (y + 1), obj_platform))
        {
            y += 5
            state = 50
            x = (other.x + 16)
            y = floor(y)
            if ((y mod 2) == 1)
                y -= 1
        }
    }
}
