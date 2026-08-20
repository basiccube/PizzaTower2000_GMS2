#macro CAM_X (instance_exists(obj_camera) ? obj_camera.cam_x : camera_get_view_x(view_camera[0]))
#macro CAM_Y (instance_exists(obj_camera) ? obj_camera.cam_y : camera_get_view_y(view_camera[0]))

#macro SCREEN_WIDTH global.screenw
#macro SCREEN_HEIGHT global.screenh

image_speed = 0.35
depth = -400
alarm[1] = 60

global.minutes = 1
global.seconds = 59
global.timedgate = false

shake_mag = 0
shake_mag_acc = 0

timestop = true
chargecamera = 0

cam_x = 0
cam_y = 0
cam_target = obj_player

hud_x = 110
hud_y = 84

player_yoffset = 0
peppino_sprite = spr_hud_normal
speedbar_index = 0
speedbar_sprite = spr_speedbar

update_camera = function()
{
	if (instance_exists(cam_target) && !obj_player.state.is([PLAYER_GAMEOVER, PLAYER_TIMESUP]))
	{
		if obj_player.state.is([PLAYER_MACH3, PLAYER_MACHROLL])
		{
			var target = obj_player.xscale * 140
			chargecamera = approach(chargecamera, target, 4)
		}
		else if (obj_player.state.is([PLAYER_MACH2, PLAYER_TUMBLE]) || (obj_player.state.is(PLAYER_SUPLEXDASH) && obj_player.movespeed > 12))
		{
			var target = obj_player.xscale * 80
			chargecamera = approach(chargecamera, target, 2)
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
}