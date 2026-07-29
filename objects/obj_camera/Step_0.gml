if (room == rank_room || room == timesuproom || room == levelselect)
    visible = false
else
    visible = true
if (global.panic == 1 || global.timedgate == 1)
    timestop = 0
else
    timestop = 1
if (global.panic && timestop == 0 && alarm[1] <= 0)
    alarm[1] = 60
if (room == timesuproom)
    timestop = 1
if (global.seconds == 0 && global.minutes == 0 && global.panic && room != timesuproom && (!instance_exists(obj_endlevelfade)))
{
    obj_player.state = 27
    obj_player.targetDoor = "A"
    room = timesuproom
    obj_player.image_index = 0
}
if (global.seconds == 0 && global.minutes == 0 && global.timedgate)
{
    global.timedgate = 0
    global.seconds = 30
}
if (global.seconds < 0)
{
    global.seconds = 59
    global.minutes -= 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}

if (global.panic == 1 || obj_player.sprite_index == spr_player_timesup)
{
    shake_mag = 2
    shake_mag_acc = (3 / room_speed)
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}

if (instance_exists(obj_player) && obj_player.state != 27 && obj_player.state != 46)
{
    if (obj_player.state == 81 || obj_player.state == 28)
    {
        if (chargecamera > (obj_player.xscale * 140))
            chargecamera -= 4
        if (chargecamera < (obj_player.xscale * 140))
            chargecamera += 4
        cam_x = (obj_player.x - (global.screenw / 2)) + chargecamera
    }
    else if (obj_player.state == 61 || obj_player.state == 29 || (obj_player.state == 13 && obj_player.movespeed > 12))
    {
        if (chargecamera > (obj_player.xscale * 80))
            chargecamera -= 2
        if (chargecamera < (obj_player.xscale * 80))
            chargecamera += 2
        cam_x = (obj_player.x - (global.screenw / 2)) + chargecamera
    }
    else
    {
        if (chargecamera > 0)
            chargecamera -= 4
        if (chargecamera < 0)
            chargecamera += 4
        cam_x = (obj_player.x - (global.screenw / 2)) + chargecamera
    }
    
    cam_x = clamp(cam_x, 0, (room_width - global.screenw))
    cam_y = obj_player.y - (global.screenh / 2)
    cam_y = clamp(cam_y, 0, room_height - global.screenh)
    if (shake_mag != 0)
    {
        cam_x = (obj_player.x - (global.screenw / 2)) + chargecamera
        cam_x = clamp(cam_x, 0, room_width - global.screenw)
        cam_y = (obj_player.y - (global.screenh / 2)) + random(shake_mag)
        cam_y = clamp(cam_y, 0 + random(shake_mag), (room_height - global.screenh) + random(shake_mag))
    }
    
    __view_set( e__VW.XView, 0, cam_x )
    __view_set( e__VW.YView, 0, cam_y )
}
