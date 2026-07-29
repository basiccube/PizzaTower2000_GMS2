with (obj_player)
{
    state = 43
    sprite_index = choose(spr_player_parry1, spr_player_parry2)
    image_index = 0
    image_speed = 0.35
    snd_play(sfx_parry)
    taunttimer = 20
    movespeed = 8
    parry_inst = -4
    parry_count = parry_max
    flash = 1
}
alarm[0] = die_time
collisioned = 1
