scr_playerstates()
scr_playersounds()

if (state == 61 || state == 85 || state == 35 || state == 6 || state == 4 || state == 9 || state == 16 || state == 18 || state == 25 || state == 31 || state == 25 || state == 28 || state == 81 || state == 65 || state == 54)
    attacking = 1
else
    attacking = 0

if (state != 63 && state != 57 && state != 6 && state != 30 && state != 56 && state != 24 && state != 28 && state != 29 && state != 64 && state != 59 && state != 58)
    mask_index = spr_player_mask
else
    mask_index = spr_crouchmask

if (state == 14 || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == 47 || state == 69 || state == 55 || state == 52 || state == 46)
    cutscene = 1
else
    cutscene = 0

if (state != 69 && state != 52 && state != 47 && state != 55 && state != 27 && state != 14 && state != 46)
    scr_collide()
