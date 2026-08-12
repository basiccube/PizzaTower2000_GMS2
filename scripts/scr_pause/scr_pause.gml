function scr_create_pause_image()
{
	draw_set_alpha(1)
	screensprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)
}

function scr_draw_pause_image()
{ draw_sprite(screensprite, 0, 0, 0); }

function scr_delete_pause_image()
{
	if sprite_exists(screensprite)
		sprite_delete(screensprite)
}