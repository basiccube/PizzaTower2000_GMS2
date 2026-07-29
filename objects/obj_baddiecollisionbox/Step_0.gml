if (!instance_exists(baddieID))
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}

if (instance_exists(baddieID) && place_meeting(x, y, obj_player))
{
    if (baddieID.state != 85)
    {
        if (baddieID.state != 98)
        {
            with (obj_player)
            {
                if (instance_exists(other.baddieID))
                {
                    if (y < other.baddieID.y && attacking == 0 && state == 49 && vsp > 0 && sprite_index != spr_player_stompprep)
                    {
                        snd_play(sfx_bump)
                        if (vsp > 0)
                        {
                            other.baddieID.stunned = 200
                            if (x != other.baddieID.x)
                                other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                            if (other.baddieID.object_index == obj_pizzaball)
                                global.golfhit += 1
                            image_index = 0
                            if keyJump_held
                            {
                                other.baddieID.vsp = -5
                                other.baddieID.hsp = ((-other.baddieID.image_xscale) * 3)
                                instance_create(x, (y + 50), obj_stompeffect)
                                other.baddieID.state = 95
                                stompAnim = 1
                                other.baddieID.image_index = 0
                                vsp = -14
                                sprite_index = spr_player_stompprep
                            }
                            else
                            {
                                other.baddieID.vsp = -5
                                other.baddieID.hsp = ((-other.baddieID.image_xscale) * 3)
                                instance_create(x, (y + 50), obj_stompeffect)
                                other.baddieID.state = 95
                                stompAnim = 1
                                other.baddieID.image_index = 0
                                vsp = -9
                                sprite_index = spr_player_stompprep
                            }
                        }
                    }
                }
                if (instance_exists(other.baddieID) && (state == 61 || state == 28) && other.baddieID.stunbuffer <= 0)
                {
                    other.baddieID.stunbuffer = 15
                    other.baddieID.flash = 1
                    other.baddieID.vsp = -5
                    other.baddieID.hsp = xscale * 7
                    other.baddieID.image_index = 0
                    other.baddieID.stunned = 200
                    other.baddieID.state = 95
                    if (other.baddieID.object_index == obj_pizzaball)
                        global.golfhit += 1
                    machpunchAnim = 1
                    if (!scr_solid(x, y + 1) && keyJump_held && state == 61)
                    {
                        sprite_index = spr_player_mach2jump
                        vsp = -11
                    }
                }
                if (instance_exists(other.baddieID) && attacking == 1 && state != 61 && state != 28)
                {
                    if (other.baddieID.object_index != obj_pizzaball)
                    {
                        global.hit += 1
                        if (state == 81)
                            other.baddieID.shot = 1
                        image_index = 0
                        if (state == 25)
                        {
                            obj_player.image_index = 0
                            obj_player.vsp = -7
                            obj_player.facestompAnim = 1
                            snd_play(sfx_punch)
                            instance_create(x, y, obj_bumpeffect)
                            instance_create(x, (y + 50), obj_stompeffect)
                            if (!global.highperformance)
                            {
                                instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar)
                                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs)
                            }
                            other.baddieID.image_index = 0
                            other.baddieID.stunned = 200
                            other.baddieID.state = 95
                            with (other.baddieID)
                                hp -= 1
                            if (other.baddieID.hp == 0)
                            {
                                with (other.id) 
                                    instance_destroy()
                                with (other.baddieID)
                                    instance_destroy()
                            }
                        }
                        else if (state == 81)
                        {
                            snd_play(sfx_punch)
                            instance_create((other.baddieID.x + (xscale * 40)), other.baddieID.y, obj_punchdust)
                            if (!global.highperformance)
                            {
                                instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar)
                                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs)
                            }
                            with (other.baddieID)
                                instance_destroy()
                        }
                        else
                        {
                            with (other.id) 
                                instance_destroy()
                            with (other.baddieID)
                                instance_destroy()
                            machpunchAnim = 1
                            if ((!(scr_solid(x, (y + 1)))) && keyJump_held)
                                vsp = -11
                        }
                    }
                }
                if (!instance_exists(other.baddieID))
                {
                    with (other.id)
                        instance_destroy()
                }
            }
        }
    }
}
if (!instance_exists(baddieID))
    instance_destroy()
