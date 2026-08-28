visible = !(room == rm_rank_room || room == rm_timesup_room || room == rm_main_menu)

timestop = !(global.panic || global.timedgate || room == rm_timesup_room)
if (global.panic && !timestop && alarm[1] <= 0)
    alarm[1] = 60

if (global.seconds <= 0 && global.minutes <= 0 && global.panic && room != rm_timesup_room && !instance_exists(obj_endlevelfade))
{
	with (obj_player)
	{
		image_index = 0
		targetDoor = "A"
		state.change(PLAYER_TIMESUP)
	}
    room = rm_timesup_room
}

if (global.seconds == 0 && global.minutes == 0 && global.timedgate)
{
    global.timedgate = false
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
	shake_mag_acc = 3 / room_speed
}
if (shake_mag > 0)
{
	shake_mag -= shake_mag_acc
	if (shake_mag < 0)
		shake_mag = 0
}