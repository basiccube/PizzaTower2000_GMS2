var cx = CAM_X
var cy = CAM_Y

draw_set_alpha(0.75)
draw_rectangle_color(cx, cy + 24, cx + 338, cy + 400, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
draw_set_alpha(1)

draw_sprite_part(obj_editor.roombg, 0, 0, 0, 320, 320, cx + 8, cy + 32)
