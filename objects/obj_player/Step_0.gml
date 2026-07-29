scr_playerstates()
scr_playersounds()
scr_collide_destructibles()
if (state == 46 && sprite_index == spr_player_deathend && y > (room_height + 400))
{
    scr_playerreset()
    targetDoor = "B"
    room_goto(obj_room.hub_1)
}
if ((!instance_exists(baddiegrabbedID)) && (state == 37 || state == 34 || state == 85))
    state = 0
if (!((state == 37 || state == 34)))
    baddiegrabbedID = 0
if (suplexmove == 1 && grounded)
    suplexmove = 0
if (state != 13)
    grav = 0.5
if (global.combotime > 0 && !cutscene)
    global.combotime -= 0.25
if (global.combotime <= 0 && global.combo != 0)
    global.combo = 0
if (input_buffer_jump < 8)
    input_buffer_jump += 1
if (inv_frames == 0 && hurted == 0)
    image_alpha = 1
if (state == 61 || state == 85 || state == 35 || state == 6 || state == 4 || state == 9 || state == 16 || state == 18 || state == 25 || state == 31 || state == 25 || state == 28 || state == 81 || state == 65 || state == 54)
    attacking = 1
else
    attacking = 0
if (state == 32 || state == 38 || state == 39 || state == 41 || state == 40)
    grabbing = 1
else
    grabbing = 0
if (state != 16)
    bounce = 0

if (flash && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)

if ((state != 49 && state != 58 && state != 3) || vsp < 0)
    fallinganimation = 0
if (state != 68 && state != 0 && state != 62)
    facehurt = 0
if (state != 0 && state != 62)
    machslideAnim = 0
if (state != 0)
    idle = 0
if (state != 60 && state != 49 && state != 13 && state != 0 && state != 61 && state != 81 && state != 82 && state != 15 && state != 29 && state != 9)
    momemtum = 0
if (state != 54 && state != 56)
    a = 0
if (state != 25)
    facestompAnim = 0
if (state != 33)
    slamming = 0
if (state != 65)
    superslam = 0
if (state != 13 && state != 59)
    crouchslipbuffer = 0
if (state != 61)
{
    machpunchAnim = 0
    machfreefall = 0
}
if (state != 49)
{
    ladderbuffer = 0
    stompAnim = 0
}
if (!global.highperformance)
{
    if ((state == 81 || state == 28 || state == 85 || state == 13 || (state == 62 && mach2 >= 100)) && !instance_exists(obj_mach3effect))
    {
        toomuchalarm1 = 6
        instance_create(x, y, obj_mach3effect)
    }
    if (toomuchalarm1 > 0)
    {
        toomuchalarm1 -= 1
        if (toomuchalarm1 <= 0 && (state == 81 || state == 85 || (state == 62 && mach2 >= 100) || state == 28 || state == 13 || (state == 24 && mach2 >= 100)))
        {
            instance_create(x, y, obj_mach3effect)
            toomuchalarm1 = 6
        }
    }
    if (state == 61 && !instance_exists(obj_mach2effect))
    {
        toomuchalarm2 = 5
        instance_create(x, y, obj_mach2effect)
    }
    if (toomuchalarm2 > 0)
    {
        toomuchalarm2 -= 1
        if (toomuchalarm2 <= 0 && state == 61)
        {
            instance_create(x, y, obj_mach2effect)
            toomuchalarm2 = 5
        }
    }
}
if (state != 63 && state != 57 && state != 6 && state != 30 && state != 56 && state != 24 && state != 28 && state != 29 && state != 64 && state != 59 && state != 58)
    mask_index = spr_player_mask
else
    mask_index = spr_crouchmask
if (state == 14 || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == 47 || state == 69 || state == 55 || state == 52 || state == 46)
    cutscene = 1
else
    cutscene = 0
if ((place_meeting(x, y, obj_door) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_startgate) || place_meeting(x, y, obj_roomdoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == 0)
    instance_create(x, y, obj_uparrow)
    
if (state != 69 && state != 52 && state != 47 && state != 55 && state != 27 && state != 14 && state != 46)
    scr_collide()
