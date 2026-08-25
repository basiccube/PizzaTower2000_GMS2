function ParticleData(px, py, spr, animated = false) constructor
{
	x = px
	y = py
	
	sprite = spr
	index = 0
	angle = 0
	
	xscale = 1
	yscale = 1
	
	sprite_width = sprite_get_width(spr)
	sprite_height = sprite_get_height(spr)
	image_speed = sprite_get_speed(spr)
	image_number = sprite_get_number(spr)
	
	hsp = 0
	vsp = 0
	grav = 0.4
	fallspeed = 12
	
	isAnimated = animated
	destroyOnAnimEnd = false
}

function create_debris(x, y, spr, animated = false)
{
	var part = new ParticleData(x, y, spr, animated)
	with (part)
	{
		index = irandom(image_number - 1)
		angle = irandom(360)
		
		hsp = random_range(-4, 4)
		vsp = random_range(-4, 0)
	}
	
	ds_list_add(particleSystem.particleList, part)
	return part;
}

function create_effect(x, y, spr)
{
	var effect = create_debris(x, y, spr)
	with (effect)
	{
		isAnimated = true
		destroyOnAnimEnd = true
		
		index = 0
		angle = 0
		
		hsp = 0
		vsp = 0
		grav = 0
	}
		
	return effect;
}

function clear_particles()
{
	var len = ds_list_size(particleSystem.particleList)
	for (var i = 0; i < len; i++)
	{
		var part = ds_list_find_value(particleSystem.particleList, i)
		if is_struct(part)
		{
			part = undefined
			delete part;
		}
	}
	ds_list_clear(particleSystem.particleList)
}