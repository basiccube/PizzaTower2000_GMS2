function scr_enemy_grabbed() {
	image_xscale = (-obj_playerOLD.xscale)
	stunned = 200
	obj_playerOLD.baddiegrabbedID = id
	if (obj_playerOLD.state == 37 || obj_playerOLD.state == 48 || obj_playerOLD.state == 34 || obj_playerOLD.state == 85)
	{
	    if (obj_playerOLD.state == 37)
	    {
	        x = obj_playerOLD.x
	        y = obj_playerOLD.y - 50
	    }
	    else if (obj_playerOLD.state == 85)
	    {
	        x = obj_playerOLD.x + (obj_playerOLD.xscale * 15)
	        y = obj_playerOLD.y - 30
	    }
	    else
	    {
	        x = obj_playerOLD.x + (obj_playerOLD.xscale * 15)
	        y = obj_playerOLD.y
	    }
	    image_xscale = (-obj_playerOLD.xscale)
	}
	with (obj_playerOLD)
	{
	    if (!(state == 37 || state == 48 || obj_playerOLD.state == 34 || state == 85))
	    {
	        other.x = x
	        other.y = y
	        other.state = 95
	        other.image_index = 0
	    }
	    if (keyDown_held && state == 37 && grounded)
	    {
	        image_index = 0
	        state = 0
	        other.state = 95
	        other.hsp = ((-other.image_xscale) * 9)
	        other.vsp = -2
	    }
	}
	hsp = 0
	if ((obj_playerOLD.sprite_index == spr_player_punch && floor(obj_playerOLD.image_index) == 0) || obj_playerOLD.state == 43)
	{
	    instance_create((x + (obj_playerOLD.xscale * 30)), y, obj_bumpeffect)
	    alarm[1] = 5
	    thrown = 1
	    x = obj_playerOLD.x
	    y = obj_playerOLD.y
	    state = 95
	    hsp = ((-image_xscale) * 25)
	    grav = 0
	    vsp = -1
	    global.combotime = 60
	    global.style += 5
	    if (object_index == obj_pizzaball)
	        global.golfhit += 1
		
	    instance_create(x, y, obj_slapstar)
	    instance_create(x, y, obj_baddiegibs)
	    flash = 1
	    with (obj_camera)
	    {
	        shake_mag = 3
	        shake_mag_acc = (3 / room_speed)
	    }
	}

	if (obj_playerOLD.sprite_index == spr_player_uppunch && floor(obj_playerOLD.image_index) == 0)
	{
	    instance_create((x + ((-obj_playerOLD.xscale) * 15)), (y - 50), obj_bumpeffect)
	    alarm[1] = 5
	    thrown = 1
	    x = obj_playerOLD.x
	    y = obj_playerOLD.y
	    hsp = ((-image_xscale) * 2)
	    state = 95
	    vsp = -20
	    global.combotime = 60
	    global.style += 5
	    if (object_index == obj_pizzaball)
	        global.golfhit += 1
	    instance_create(x, y, obj_slapstar)
	    instance_create(x, y, obj_baddiegibs)
	    flash = 1
	    with (obj_camera)
	    {
	        shake_mag = 3
	        shake_mag_acc = (3 / room_speed)
	    }
	}

	if (obj_playerOLD.state == 85)
	{
	    x = (obj_playerOLD.x + (obj_playerOLD.xscale * 20))
	    y = obj_playerOLD.y
	    if (scr_solid(x + obj_playerOLD.xscale, y))
	    {
	        instance_create((x + ((-obj_playerOLD.xscale) * 15)), (y - 50), obj_bumpeffect)
	        alarm[1] = 5
	        thrown = 1
	        x = obj_playerOLD.x
	        y = obj_playerOLD.y
	        hsp = ((-image_xscale) * 4)
	        state = 95
	        vsp = -4
	        global.combotime = 60
	        global.style += 5
	        if (object_index == obj_pizzaball)
	            global.golfhit += 1
	        instance_create(x, y, obj_slapstar)
	        instance_create(x, y, obj_baddiegibs)
	        flash = 1
	        with (obj_camera)
	        {
	            shake_mag = 3
	            shake_mag_acc = (3 / room_speed)
	        }
	    }
	}

	if (obj_playerOLD.state == 34)
	{
	    if (obj_playerOLD.piledriveranim)
	    {
	        if (floor(obj_playerOLD.image_index) == 0)
	        {
	            depth = 0
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * 10))
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 1)
	        {
	            depth = 0
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * 5))
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 2)
	        {
	            depth = 0
	            x = obj_playerOLD.x
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 3)
	        {
	            depth = 0
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * -5))
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 4)
	        {
	            depth = 0
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * -10))
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 5)
	        {
	            depth = -7
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * -5))
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 6)
	        {
	            depth = -7
	            x = obj_playerOLD.x
	            y = obj_playerOLD.y
	        }
	        if (floor(obj_playerOLD.image_index) == 7)
	        {
	            depth = -7
	            x = (obj_playerOLD.x + (obj_playerOLD.xscale * 5))
	            y = obj_playerOLD.y
	        }
	    }
	    else
	    {
	        depth = 0
	        x = obj_playerOLD.x - obj_playerOLD.piledriverx
	        y = obj_playerOLD.y - obj_playerOLD.piledrivery
	    }
    
	    if (obj_playerOLD.sprite_index == spr_player_piledriverland)
	    {
	        snd_play(sfx_punch)
	        instance_create(x, y, obj_slapstar)
	        instance_create(x, y, obj_baddiegibs)
	        flash = 1
	        global.combotime = 60
	        global.style += 5
	        alarm[1] = 5
	        thrown = 1
	        x = obj_playerOLD.x
	        y = obj_playerOLD.y
	        if (object_index == obj_pizzaball)
	            global.golfhit += 1
	        state = 95
	        hsp = ((-image_xscale) * 10)
	        vsp = -10
	    }
	}
	sprite_index = grabbedspr
	image_speed = 0.35



}
