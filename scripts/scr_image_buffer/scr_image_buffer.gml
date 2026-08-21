#macro IMGBUF_PATH "img/"
#macro IMGBUF_EXT ".buf"

// imgbuf format:
// u16 - width
// u16 - height
// u32 - color data (width * height)

function imgbuf_save(sprite, name)
{
	var buf = buffer_create(512, buffer_grow, 1)
	
	var w = sprite_get_width(sprite)
	var h = sprite_get_height(sprite)
	
	buffer_write(buf, buffer_u16, w)
	buffer_write(buf, buffer_u16, h)
	
	var surf = surface_create(w, h)
	surface_set_target(surf)
	
	draw_sprite_ext(sprite, 0, 0, 0, 1, 1, 0, c_white, 1)
	
	var px = 0
	var py = 0
	repeat (w * h)
	{
		if (px >= w)
		{
			px = 0
			py++
		}
		
		var pixel = surface_getpixel(surf, px, py)
		buffer_write(buf, buffer_u32, pixel)
		
		px++
	}
	
	surface_reset_target()
	surface_free(surf)
	
	buffer_save(buf, IMGBUF_PATH + name + IMGBUF_EXT)
	buffer_delete(buf)
}

function imgbuf_load(name)
{
	var path = IMGBUF_PATH + name + IMGBUF_EXT
	if !file_exists(path)
	{
		print("File ", path, " doesn't exist")
		return undefined;
	}
	
	var buf = buffer_load(path)
	if (buf == -1)
	{
		print("Failed to load buffer ", path)
		return undefined;
	}
	
	var w = buffer_read(buf, buffer_u16)
	var h = buffer_read(buf, buffer_u16)
	
	var surf = surface_create(w, h)
	surface_set_target(surf)
	
	var px = 0
	var py = 0
	repeat (w * h)
	{
		if (px >= w)
		{
			px = 0
			py++
		}
		
		var pixel = buffer_read(buf, buffer_u32)
		draw_sprite_ext(spr_pixel, 0, px, py, 1, 1, 0, pixel, 1)
		
		px++
	}
	
	surface_reset_target()
	
	var sprite = sprite_create_from_surface(surf, 0, 0, w, h, false, false, 0, 0)
	
	surface_free(surf)
	buffer_delete(buf)
	
	return sprite;
}