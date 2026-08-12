hud_x = cam_x + 110
hud_y = cam_y + 80

if !instance_exists(obj_playerOLD)
	exit;

if (obj_playerOLD.y < 200 && obj_playerOLD.x < 200)
    player_yoffset = approach(player_yoffset, -300, 15)
else
    player_yoffset = approach(player_yoffset, 0, 15)

if (global.hud)
    exit;

if (obj_playerOLD.state == 83 || (obj_playerOLD.state == 68 && shake_mag > 0))
    peppino_sprite = spr_hud_stun
else if (obj_playerOLD.sprite_index == spr_player_victory || obj_playerOLD.state == 47 || obj_playerOLD.state == 53 || obj_playerOLD.state == 14)
    peppino_sprite = spr_hud_happy
else if (obj_playerOLD.state == 60 || obj_playerOLD.state == 29 || obj_playerOLD.state == 24 || obj_playerOLD.state == 82 || obj_playerOLD.state == 65 || obj_playerOLD.state == 48 || obj_playerOLD.state == 54 || obj_playerOLD.state == 33 || obj_playerOLD.state == 56 || obj_playerOLD.state == 37 || obj_playerOLD.state == 38 || obj_playerOLD.state == 42 || obj_playerOLD.state == 39 || obj_playerOLD.state == 40 || obj_playerOLD.state == 41)
    peppino_sprite = spr_hud_mach1
else if (obj_playerOLD.state == 61 || obj_playerOLD.state == 13 || obj_playerOLD.sprite_index == spr_player_machslideboost)
    peppino_sprite = spr_hud_mach2
else if (obj_playerOLD.state == 81 || obj_playerOLD.state == 28 || obj_playerOLD.sprite_index == spr_player_machslideboost3)
    peppino_sprite = spr_hud_mach3
else if (obj_playerOLD.state == 64 || obj_playerOLD.state == 27 || obj_playerOLD.state == 18 || (obj_playerOLD.state == 45 && obj_playerOLD.sprite_index == spr_player_scream))
    peppino_sprite = spr_hud_hurt
else if (obj_playerOLD.state == 15 || obj_playerOLD.state == 16 || obj_playerOLD.state == 9)
    peppino_sprite = spr_hud_knightpep
else
    peppino_sprite = spr_hud_normal

validstates = (obj_playerOLD.state == 60 || obj_playerOLD.state == 61 || obj_playerOLD.state == 81 || obj_playerOLD.state == 8 || obj_playerOLD.state == 62 || obj_playerOLD.state == 28 || obj_playerOLD.state == 13)

if (validstates)
{
    if (obj_playerOLD.movespeed < 2.4)
    {
        speedbar_index = 0
        speedbar_sprite = spr_speedbar
    }
    else if (obj_playerOLD.movespeed >= 2.4 && obj_playerOLD.movespeed < 4.8)
    {
        speedbar_index = 1
        speedbar_sprite = spr_speedbar
    }
    else if (obj_playerOLD.movespeed >= 4.8 && obj_playerOLD.movespeed < 7.2)
    {
        speedbar_index = 2
        speedbar_sprite = spr_speedbar
    }
    else if (obj_playerOLD.movespeed >= 7.2 && obj_playerOLD.movespeed < 9.6)
    {
        speedbar_index = 3
        speedbar_sprite = spr_speedbar
    }
    else if (obj_playerOLD.movespeed >= 9.6 && obj_playerOLD.movespeed < 12)
    {
        speedbar_index = 4
        speedbar_sprite = spr_speedbar
    }
    else if (obj_playerOLD.movespeed >= 12)
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

