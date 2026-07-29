if (drop && !disappear)
{
    alarm[4] = 400
    disappear = true
}

if (balloon && !place_meeting(x, y, obj_balloon))
    drop = true

if cantcollect
{
    if !flicker
    {
        alarm[1] = 3
        flicker = true
    }
}
else
    image_alpha = 1

if drop
{
    scr_collide()
    if grounded
        hsp = 0
}
