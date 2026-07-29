if (state != 98 && hp > 0 && object_index != obj_pizzaball)
{
    snd_play(sfx_bump)
    if (hp > 0)
        hp -= 1
        
    with (instance_create(x, y, obj_spikehurteffect))
        image_xscale = other.image_xscale
    if (!global.highperformance)
    {
        instance_create(x, y, obj_bumpeffect)
        instance_create(x, y, obj_bangeffect)
    }
    
    state = 95
    stunned = 150
    
    if (object_index == obj_pizzaball)
        global.golfhit += 1
    
    if (other.x != x)
        image_xscale = -sign(x - other.x)
    
    with (other.id)
        instance_destroy()
        
    if (obj_player.keyUp_held)
    {
        vsp = -16
        hsp = (-image_xscale * 1)
    }
    else
    {
        vsp = -4
        hsp = (-image_xscale * 3)
    }
    
    obj_player.vsp = -3
    obj_player.hsp = 0
    obj_player.movespeed = 0
    obj_player.image_index = 0
    obj_player.sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4)
    obj_player.state = 48
}
else if ((hp <= 0 || object_index == obj_pizzaball) && state != 98)
{
    snd_play(sfx_bump)
    instance_create((x + (obj_player.xscale * 40)), y, obj_punchdust)
    state = 98
    obj_player.state = 37
    obj_player.baddiegrabbedID = id
    with (other.id)
        instance_destroy()
    obj_player.movespeed = 0
    obj_player.hsp = 0
    obj_player.sprite_index = spr_player_haulingidle
}
