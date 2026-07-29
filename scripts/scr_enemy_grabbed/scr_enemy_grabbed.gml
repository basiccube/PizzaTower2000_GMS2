function scr_enemy_grabbed() {
	image_xscale = (-obj_player.xscale)
	stunned = 200
	obj_player.baddiegrabbedID = id
	if (obj_player.state == 37 || obj_player.state == 48 || obj_player.state == 34 || obj_player.state == 85)
	{
	    if (obj_player.state == 37)
	    {
	        x = obj_player.x
	        y = obj_player.y - 50
	    }
	    else if (obj_player.state == 85)
	    {
	        x = obj_player.x + (obj_player.xscale * 15)
	        y = obj_player.y - 30
	    }
	    else
	    {
	        x = obj_player.x + (obj_player.xscale * 15)
	        y = obj_player.y
	    }
	    image_xscale = (-obj_player.xscale)
	}
	with (obj_player)
	{
	    if (!(state == 37 || state == 48 || obj_player.state == 34 || state == 85))
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
	if ((obj_player.sprite_index == spr_player_punch && floor(obj_player.image_index) == 0) || obj_player.state == 43)
	{
	    instance_create((x + (obj_player.xscale * 30)), y, obj_bumpeffect)
	    alarm[1] = 5
	    thrown = 1
	    x = obj_player.x
	    y = obj_player.y
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

	if (obj_player.sprite_index == spr_player_uppunch && floor(obj_player.image_index) == 0)
	{
	    instance_create((x + ((-obj_player.xscale) * 15)), (y - 50), obj_bumpeffect)
	    alarm[1] = 5
	    thrown = 1
	    x = obj_player.x
	    y = obj_player.y
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

	if (obj_player.state == 85)
	{
	    x = (obj_player.x + (obj_player.xscale * 20))
	    y = obj_player.y
	    if (scr_solid(x + obj_player.xscale, y))
	    {
	        instance_create((x + ((-obj_player.xscale) * 15)), (y - 50), obj_bumpeffect)
	        alarm[1] = 5
	        thrown = 1
	        x = obj_player.x
	        y = obj_player.y
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

	if (obj_player.state == 34)
	{
	    if (obj_player.piledriveranim)
	    {
	        if (floor(obj_player.image_index) == 0)
	        {
	            depth = 0
	            x = (obj_player.x + (obj_player.xscale * 10))
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 1)
	        {
	            depth = 0
	            x = (obj_player.x + (obj_player.xscale * 5))
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 2)
	        {
	            depth = 0
	            x = obj_player.x
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 3)
	        {
	            depth = 0
	            x = (obj_player.x + (obj_player.xscale * -5))
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 4)
	        {
	            depth = 0
	            x = (obj_player.x + (obj_player.xscale * -10))
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 5)
	        {
	            depth = -7
	            x = (obj_player.x + (obj_player.xscale * -5))
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 6)
	        {
	            depth = -7
	            x = obj_player.x
	            y = obj_player.y
	        }
	        if (floor(obj_player.image_index) == 7)
	        {
	            depth = -7
	            x = (obj_player.x + (obj_player.xscale * 5))
	            y = obj_player.y
	        }
	    }
	    else
	    {
	        depth = 0
	        x = obj_player.x - obj_player.piledriverx
	        y = obj_player.y - obj_player.piledrivery
	    }
    
	    if (obj_player.sprite_index == spr_player_piledriverland)
	    {
	        snd_play(sfx_punch)
	        instance_create(x, y, obj_slapstar)
	        instance_create(x, y, obj_baddiegibs)
	        flash = 1
	        global.combotime = 60
	        global.style += 5
	        alarm[1] = 5
	        thrown = 1
	        x = obj_player.x
	        y = obj_player.y
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
