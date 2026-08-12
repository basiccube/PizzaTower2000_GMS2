visible = !(room == rank_room || room == timesuproom || room == levelselect)

timestop = !(global.panic || global.timedgate || room == timesuproom)
if (global.panic && !timestop && alarm[1] <= 0)
    alarm[1] = 60

if (global.seconds <= 0 && global.minutes <= 0 && global.panic && room != timesuproom && !instance_exists(obj_endlevelfade))
{
    obj_playerOLD.state = 27
    obj_playerOLD.targetDoor = "A"
    room = timesuproom
    obj_playerOLD.image_index = 0
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

if (global.panic || obj_player.sprite_index == spr_player_timesUp)
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

var player = (cam_target.object_index == obj_playerOLD)
if (instance_exists(cam_target) && ((player && obj_playerOLD.state != 27 && obj_playerOLD.state != 46) || !player))
{
    if (player && (obj_playerOLD.state == 81 || obj_playerOLD.state == 28))
    {
        if (chargecamera > (obj_playerOLD.xscale * 140))
            chargecamera -= 4
        if (chargecamera < (obj_playerOLD.xscale * 140))
            chargecamera += 4
    }
    else if (player && (obj_playerOLD.state == 61 || obj_playerOLD.state == 29 || (obj_playerOLD.state == 13 && obj_playerOLD.movespeed > 12)))
    {
        if (chargecamera > (obj_playerOLD.xscale * 80))
            chargecamera -= 2
        if (chargecamera < (obj_playerOLD.xscale * 80))
            chargecamera += 2
	}
	else
		chargecamera = approach(chargecamera, 0, 4)
		
	var shake = 0
	if (shake_mag != 0)
		shake = irandom_range(-shake_mag, shake_mag)
	
	cam_x = cam_target.x - (SCREEN_WIDTH / 2) + chargecamera
	cam_x = clamp(cam_x, 0, room_width - SCREEN_WIDTH)
	
	cam_y = cam_target.y - (SCREEN_HEIGHT / 2) + shake
	cam_y = clamp(cam_y, shake, room_height - SCREEN_HEIGHT + shake)
	
	camera_set_view_pos(view_camera[0], cam_x, cam_y)
}