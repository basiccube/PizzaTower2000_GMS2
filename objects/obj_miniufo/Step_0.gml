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
    case 86:
        scr_pizzagoblin_throw()
        break
    case 98:
        scr_enemy_grabbed()
        break
}

if (state == 84)
    state = 91
if (state != 95 && vsp != 0)
    vsp = 0 
if (state == 95 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != 95)
    birdcreated = 0
if (state == 91 && y > ystart && !scr_solid(x, (y - 1)))
    y -= 1
if (state == 91 && y < ystart && !scr_solid(x, (y + 1)))
    y += 1
if (state == 95)
    grav = 0.5
else
    grav = 0
if (laserbuffer > 0 && state == 91 && y == ystart)
    laserbuffer -= 1
if (laserbuffer == 0 && state == 91)
{
    with (instance_create(x, y + 24, obj_miniufo_laser))
        vsp = 2
    instance_create(x, y + 50, obj_cloudeffect)
    laserbuffer = 100
} 
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 98)
    depth = 0
if (state != 95)
    thrown = 0
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
