if (visible == false)
{
    reset -= 1
    mask_index = spr_masknull
}
else
    mask_index = spr_wall
if (visible && place_meeting(x, (y - 1), obj_playerOLD))
    image_speed = 0.35
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheeseblock)
{
    image_speed = 0
    visible = false
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheeseblockreform)
{
    sprite_index = spr_cheeseblock
    image_speed = 0
    image_index = 0
}
if (reset < 0 && !place_meeting(x, y, obj_playerOLD))
{
    reset = 100
    visible = true
    image_speed = 0.35
    sprite_index = spr_cheeseblockreform
}
