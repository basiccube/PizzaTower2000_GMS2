#macro CAM_X (instance_exists(obj_camera) ? obj_camera.cam_x : camera_get_view_x(view_camera[0]))
#macro CAM_Y (instance_exists(obj_camera) ? obj_camera.cam_y : camera_get_view_y(view_camera[0]))

#macro SCREEN_WIDTH global.screenw
#macro SCREEN_HEIGHT global.screenh

image_speed = 0.35
alarm[1] = 60

global.seconds = 59
global.minutes = 1
global.timedgate = 0

shake_mag = 0
shake_mag_acc = 0

timestop = true
chargecamera = 0

cam_x = __view_get( e__VW.XView, 0 )
cam_y = __view_get( e__VW.YView, 0 )

hud_x = __view_get( e__VW.XView, 0 ) + 110
hud_y = __view_get( e__VW.YView, 0 ) + 84

player_yoffset = 0
peppino_sprite = spr_hud_normal
speedbar_index = 0
speedbar_sprite = spr_speedbar