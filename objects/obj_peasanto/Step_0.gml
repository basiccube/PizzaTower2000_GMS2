switch state
{
    case 84:
        scr_enemy_idle()
        break
    case 85:
        scr_enemy_charge()
        break 
    case 91:
        scr_enemy_walk()
        break
    case 95:
        scr_enemy_stun()
        break
    case 86:
        scr_pizzagoblin_throw()
        break
}

if (state == 95 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != 95)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && state == 85)
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id
}
if (x != obj_player.x)
{
    if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && obj_player.y == y && image_xscale == sign(obj_player.x - x))
    {
        if (state == 91 || state == 84)
        {
            chargereset = 200
            vsp = -5
            snd_play(sfx_enemyprojectile)
            image_index = 0
            image_xscale = -sign(x - obj_player.x)
            state = 85
        }
    }
}
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
