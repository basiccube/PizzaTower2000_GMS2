switch state
{
    case 84:
        scr_enemy_idle()
        break
    case 87:
        scr_enemy_turn()
        break
    case 91:
        scr_enemy_walk()
        break
    case 93:
        scr_enemy_land()
        break
    case 94:
        scr_enemy_hit()
        break
    case 95:
        scr_enemy_stun()
        break
    case 98:
        scr_enemy_grabbed()
        break
    case 86:
        scr_pizzagoblin_throw()
        break
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 98)
    depth = 0
if (state != 95)
    thrown = 0
if (sprite_index == idlespr)
    state = 84
if (state == 84 && obj_playerOLD.x > (x - 400) && obj_playerOLD.x < (x + 400) && y <= (obj_playerOLD.y + 250) && y >= (obj_playerOLD.y - 250))
{
    vsp = -6
    sprite_index = walkspr
    state = 91
}
if (state == 91)
{
    if (bombreset > 0)
        bombreset -= 1
    if (bombreset == 0)
    {
        vsp = -9
        bombreset = 120
        with (instance_create(x, y, obj_bomb))
        {
            countdown = 50
            grav = 0.5
        }
    }
    if (movespeed < 6)
        movespeed += 0.25
}
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
