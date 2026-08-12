if (global.panic && !uparrow)
{
	uparrowID = scr_create_uparrowhitbox()
	uparrow = true
}
else if uparrow
{
	instance_destroy(uparrowID)
	uparrow = false
}

var meetingPlayer = place_meeting(x, y, obj_player)
var intro = (image_index == 1 && !global.panic)

if global.panic
	image_index = 1
else if (!meetingPlayer && intro)
	image_index = 0

if (meetingPlayer && !obj_player.state.is(PLAYER_EXITDOOR) && intro)
{
	snd_play(sfx_groundpound)
	camera_shake(3, 3)
	image_index = 0
	
	with (obj_player)
		state.change(PLAYER_GATESHUT)
}