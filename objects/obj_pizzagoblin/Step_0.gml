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
if (hp <= 0)
    instance_destroy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 98)
    depth = 0
if (state != 95)
    thrown = 0
if (bombreset > 0)
    bombreset -= 1
if (x != obj_playerOLD.x && state != 86 && bombreset == 0)
{
    if (obj_playerOLD.x > (x - 400) && obj_playerOLD.x < (x + 400) && obj_playerOLD.y == y)
    {
        if (state == 91 || state == 84)
        {
            snd_play(sfx_enemyprojectile)
            image_index = 0
            image_xscale = (-(sign((x - obj_playerOLD.x))))
            state = 86
        }
    }
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
