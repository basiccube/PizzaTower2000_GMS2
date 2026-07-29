if (tilex < 0)
    tilex = 0
if (tilex > background_get_width(obj_editor.selectedtileset) - 32)
    tilex = background_get_width(obj_editor.selectedtileset) - 32
if (tiley < 0)
    tiley = 0
if (tiley > background_get_height(obj_editor.selectedtileset) - 32)
    tiley = background_get_height(obj_editor.selectedtileset) - 32
if (keyboard_check_pressed(vk_right))
    tilex += 32
else if (keyboard_check_pressed(vk_left))
    tilex -= 32
if (keyboard_check_pressed(vk_down))
    tiley += 32
else if (keyboard_check_pressed(vk_up))
    tiley -= 32
x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )
