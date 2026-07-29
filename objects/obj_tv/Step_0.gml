if (room == rank_room || room == timesuproom || room == levelselect)
{
    visible = false
    sprite_index = spr_newtv_off
}
else
    visible = true
    
if (global.hud)
    image_speed = 0.35
    
if (global.combo > 0)
{
    if (comboalpha < 1)
        comboalpha += 0.25
    if (savedcombo != global.combo)
        savedcombo = global.combo
}
else if (global.combo <= 0 && comboalpha > 0)
    comboalpha -= 0.25
 
xi = (global.screenw / 2) + choose(-1, 0, 1)
if (showtext && yi > global.screenh - 40)
    yi -= 5
else if (!showtext && yi < global.screenh + 60)
    yi += 2

if (global.hud)
{
    switch state
    {
        // normal
        case 0:
            idlespr = spr_newtv_idle
            if (global.panic)
                idlespr = spr_newtv_exprpanic
            
            var transfo;
            transfo = true
            switch obj_player.state
            {
                case 18:
                    idlespr = spr_newtv_bombpep
                    break
                case 15:
                case 16:
                case 9:
                    idlespr = spr_newtv_knightpep
                    break
                case 29:
                    idlespr = spr_newtv_tumble
                    break
                default:
                    transfo = false
                    break
            }
            
            if (!transfo)
            {
                with (obj_player)
                {
                    if (state == 81 || sprite_index == spr_player_machslideboost3)
                        tv_do_expression(spr_newtv_exprmach3)
                    else if (state == 64)
                        tv_do_expression(spr_newtv_exprhurt)
                }
            }
        
            switch sprite_index
            {
                case spr_newtv_off:
                    if (visible)
                    {
                        sprite_index = spr_newtv_open
                        image_index = 0
                    }
                    break
                case spr_newtv_open:
                    if (floor(image_index) == (image_number - 1))
                        sprite_index = idlespr
                    break
                case spr_newtv_idle:
                    if (idleanim > 0)
                        idleanim -= 1
                    if (sprite_index != idlespr)
                        sprite_index = idlespr
                    if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                    {
                        sprite_index = choose(spr_newtv_idleanim1, spr_newtv_idleanim2)
                        image_index = 0
                    }
                    break
                case spr_newtv_idleanim1:
                case spr_newtv_idleanim2:
                    if (floor(image_index) == (image_number - 1))
                    {
                        sprite_index = idlespr
                        idleanim = 240 + (60 * random(2))
                    }
                    if (idlespr != spr_newtv_idle)
                        sprite_index = idlespr
                    break
                default:
                    sprite_index = idlespr
                    break
            }
            break
        
        // white noise
        case 1:
            sprite_index = spr_newtv_whitenoise
            if (noisebuffer > 0)
                noisebuffer -= 1
            else
            {
                noisebuffer = noisemax
                if (expressionsprite != -4)
                {
                    state = 2
                    sprite_index = expressionsprite
                }
                else
                    state = 0
            }
            break
        
        // expression
        case 2:
            switch expressionsprite
            {
                case spr_newtv_exprhurt:
                    if (obj_player.state != 64)
                    {
                        if (expressionbuffer > 0)
                            expressionbuffer -= 1
                        else
                        {
                            state = 1
                            expressionsprite = -4
                        }
                    }
                    break
                case spr_newtv_exprmach3:
                    with (obj_player)
                    {
                        if (state != 81 && sprite_index != spr_player_machslideboost3)
                        {
                            other.state = 1
                            other.expressionsprite = -4
                        }
                    }
                    break
            }
            break
    }
}
else
{
    sprite_index = spr_tvcomboresult
    if (obj_player.state == 27)
    {
        alarm[0] = 50
        image_speed = 0.1
        tvsprite = spr_tvtimeout
    }
    else if (savedcombo != 0 && global.combotime <= 0 && tvsprite == spr_tvdefault)
    {
        image_speed = 0
        tvsprite = spr_tvcomboresult
        if (savedcombo >= 20)
            image_index = 3
        else if (savedcombo >= 15 && savedcombo < 20)
            image_index = 2
        else if (savedcombo >= 5 && savedcombo < 15)
            image_index = 1
        else if (savedcombo < 5)
            image_index = 0
        savedcombo = 0
        alarm[0] = 50
    }
}

if (obj_player.y < 200 && obj_player.x > (room_width - 200))
    player_yoffset = approach(player_yoffset, -300, 15)
else
    player_yoffset = approach(player_yoffset, 0, 15)
    
if (obj_player.state == 64)
{
    showtext = 1
    if (chose == 0)
        message = choose("OW!", "OUCH!", "OH!", "WOH!")
    alarm[0] = 50
    chose = 1
    if (!global.hud)
    {
        image_speed = 0.1
        tvsprite = spr_tvhurt
    }
}
else if (global.hurtcounter >= global.hurtmilestone)
{
    alarm[0] = 150
    message = "YOU HAVE HURT " + obj_player.name + " " + string(global.hurtmilestone) + " TIMES..."
    global.hurtmilestone += 3
    if (!global.hud)
    {
        image_speed = 0.1
        if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
            tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4)
    }
}

if (obj_player.state == 35)
{
    showtext = 1
    message = "SWEET DUDE!!"
    alarm[0] = 50
    if (!global.hud)
        tvsprite = spr_tvrad
}
if (obj_player.state == 51)
{
    showtext = 1
    message = "OOPS!!"
    alarm[0] = 50
    if (!global.hud)
    {
        image_speed = 0.1
        tvsprite = spr_tvbanana
    }
}
if (obj_player.state == 47)
{
    showtext = 1
    message = "GOT THE KEY!"
    alarm[0] = 50
}
    
if (global.style > 55 && global.stylethreshold < 4)
{
    global.stylethreshold += 1
    global.style = (global.style - 55)
}
if (global.style < 0 && global.stylethreshold != 0)
{
    global.stylethreshold -= 1
    global.style = (global.style + 55)
}

if (global.style >= 0 && global.combotime == 0)
    global.style -= 0.05
if (global.style < 0 && global.stylethreshold == 0)
    global.style = 0
if (global.stylethreshold == 4 && global.style > 55)
    global.style = 55

global.multiplier = global.stylethreshold + 1
