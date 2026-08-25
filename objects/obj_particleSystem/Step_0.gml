var len = ds_list_size(particleList)
for (var i = 0; i < len; i++)
{
	var part = ds_list_find_value(particleList, i)
	if is_struct(part)
	{
		with (part)
		{
			x += hsp
			y += vsp
			
			if (vsp < fallspeed)
				vsp += grav
				
			if isAnimated
				index += image_speed
				
			var destroy = false
			if (x < -sprite_width || x > room_width + sprite_width || y < -sprite_height || y > room_height + sprite_height)
				destroy = true
			
			if (destroyOnAnimEnd && index >= image_number - 1)
				destroy = true
			
			if destroy
			{
				ds_list_delete(other.particleList, i)
				i--
				
				part = undefined
				delete part;
			}
		}
	}
}