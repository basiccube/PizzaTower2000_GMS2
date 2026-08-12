#macro CAM_X (instance_exists(obj_camera) ? obj_camera.cam_x : camera_get_view_x(view_camera[0]))
#macro CAM_Y (instance_exists(obj_camera) ? obj_camera.cam_y : camera_get_view_y(view_camera[0]))

#macro SCREEN_WIDTH global.screenw
#macro SCREEN_HEIGHT global.screenh

image_speed = 0.35
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

hud_x = cam_x + 110
hud_y = cam_y + 84

player_yoffset = 0
peppino_sprite = spr_hud_normal
speedbar_index = 0
speedbar_sprite = spr_speedbar