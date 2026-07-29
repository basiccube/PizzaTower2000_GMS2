with (obj_player)
{
    if (keyUp_held && ladderbuffer == 0 && (state == 0 || state == 61 || state == 81 || state == 60 || state == 21 || state == 49 || state == 23) && state != 64 && state != 62 && state != 65 && state != 68)
    {
        mach2 = 0
        state = 50
        x = (other.x + 16)
        y = floor(y)
        if ((y mod 2) == 1)
            y -= 1
    }
}
