if (background_get_width(obj_editor.selectedtileset) <= 384)
    draw_sprite_part_ext(obj_editor.selectedtileset, 0, 0, 0, background_get_width(obj_editor.selectedtileset), background_get_height(obj_editor.selectedtileset), __view_get( e__VW.XView, 0 ) + 32, __view_get( e__VW.YView, 0 ) + 32, 1, 1, c_white, 1)
else
    draw_sprite_part_ext(obj_editor.selectedtileset, 0, 0, 0, 384, 384, __view_get( e__VW.XView, 0 ) + 32, __view_get( e__VW.YView, 0 ) + 32, 1, 1, c_white, 1)
draw_sprite(spr_cursor32, 0, __view_get( e__VW.XView, 0 ) + 32 + tilex, __view_get( e__VW.YView, 0 ) + 32 + tiley)
