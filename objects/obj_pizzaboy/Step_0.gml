switch state
{
    case 84:
        scr_enemy_idle()
        break
    case 91:
        scr_enemy_walk()
        break
    case 95:
        scr_enemy_stun()
        break
}

stunned = 100
if (state != 98)
    depth = 0
if (state != 95)
    thrown = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
    
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
