function scr_enemy_stun() {
	stunned -= 1
	if (stunbuffer > 0)
	    stunbuffer -= 1

	sprite_index = stunfallspr
	image_speed = 0.35
	if (grounded && vsp > 0)
	{
	    hsp = 0
	    if (thrown == 1 && hp <= 0)
	        instance_destroy()
	    if (hp > 0)
	        thrown = 0
	}
	if place_meeting(x, (y + 1), obj_railh)
	    hsp = -5
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = 5
	if scr_solid(x - image_xscale, y)
	{
	    with (instance_create(x, y, obj_bulletimpact))
	        image_xscale = (-other.image_xscale)
	    if (thrown == 1 && hp <= 0)
	        instance_destroy()
	    thrown = 0 
	    grav = 0.5
	    image_xscale *= -1
	    hsp = ((-image_xscale) * 4)
	}
	scr_collide()
	if (floor(image_index) == (image_number - 1) && stunned < 0)
	{
	    if (object_index != obj_miniufo)
	        vsp -= 4
	    sprite_index = idlespr
	    image_index = 0
	    state = 84
	}



}
