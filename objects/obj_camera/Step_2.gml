hud_x = (__view_get( e__VW.XView, 0 ) + 110)
hud_y = (__view_get( e__VW.YView, 0 ) + 80)

if (obj_player.y < 200 && obj_player.x < 200)
    player_yoffset = approach(player_yoffset, -300, 15)
else
    player_yoffset = approach(player_yoffset, 0, 15)
    
if (global.hud)
    exit;

if (obj_player.state == 83 || (obj_player.state == 68 && shake_mag > 0))
    peppino_sprite = spr_hud_stun
else if (obj_player.sprite_index == spr_player_victory || obj_player.state == 47 || obj_player.state == 53 || obj_player.state == 14)
    peppino_sprite = spr_hud_happy
else if (obj_player.state == 60 || obj_player.state == 29 || obj_player.state == 24 || obj_player.state == 82 || obj_player.state == 65 || obj_player.state == 48 || obj_player.state == 54 || obj_player.state == 33 || obj_player.state == 56 || obj_player.state == 37 || obj_player.state == 38 || obj_player.state == 42 || obj_player.state == 39 || obj_player.state == 40 || obj_player.state == 41)
    peppino_sprite = spr_hud_mach1
else if (obj_player.state == 61 || obj_player.state == 13 || obj_player.sprite_index == spr_player_machslideboost)
    peppino_sprite = spr_hud_mach2
else if (obj_player.state == 81 || obj_player.state == 28 || obj_player.sprite_index == spr_player_machslideboost3)
    peppino_sprite = spr_hud_mach3
else if (obj_player.state == 64 || obj_player.state == 27 || obj_player.state == 18 || (obj_player.state == 45 && obj_player.sprite_index == spr_player_bossintro))
    peppino_sprite = spr_hud_hurt
else if (obj_player.state == 15 || obj_player.state == 16 || obj_player.state == 9)
    peppino_sprite = spr_hud_knightpep
else
    peppino_sprite = spr_hud_normal

validstates = (obj_player.state == 60 || obj_player.state == 61 || obj_player.state == 81 || obj_player.state == 8 || obj_player.state == 62 || obj_player.state == 28 || obj_player.state == 13)

if (validstates)
{
    if (obj_player.movespeed < 2.4)
    {
        speedbar_index = 0
        speedbar_sprite = spr_speedbar
    }
    else if (obj_player.movespeed >= 2.4 && obj_player.movespeed < 4.8)
    {
        speedbar_index = 1
        speedbar_sprite = spr_speedbar
    }
    else if (obj_player.movespeed >= 4.8 && obj_player.movespeed < 7.2)
    {
        speedbar_index = 2
        speedbar_sprite = spr_speedbar
    }
    else if (obj_player.movespeed >= 7.2 && obj_player.movespeed < 9.6)
    {
        speedbar_index = 3
        speedbar_sprite = spr_speedbar
    }
    else if (obj_player.movespeed >= 9.6 && obj_player.movespeed < 12)
    {
        speedbar_index = 4
        speedbar_sprite = spr_speedbar
    }
    else if (obj_player.movespeed >= 12)
    {
        speedbar_index = -1
        speedbar_sprite = spr_speedbarmax
    }
}
else
{
    speedbar_index = 0
    speedbar_sprite = spr_speedbar
}

