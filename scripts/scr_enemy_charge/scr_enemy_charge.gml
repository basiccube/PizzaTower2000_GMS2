function scr_enemy_charge() {
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))))
	    hsp = (image_xscale * (movespeed * 4))
	else
	    hsp = 0
	if (x != obj_player.x)
	{
	    if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && obj_player.y == y && image_xscale == sign((obj_player.x - x)))
	        chargereset = 200
	}
	image_speed = 0.35
	chargereset -= 1
	if (chargereset == 0)
	    state = 91
	if (((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    image_xscale *= -1
	if (!(scr_solid((x + 15), (y + 31)) || place_meeting((x + 15), (y + 31), obj_platform)) && image_xscale == 1 && movespeed > 0)
	    image_xscale *= -1
	if (!(scr_solid((x - 15), (y + 31)) || place_meeting((x - 15), (y + 31), obj_platform)) && image_xscale == -1 && movespeed > 0)
	    image_xscale *= -1
	if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
	    hsp += 0.1
	else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
	    hsp -= 0.1
	if (object_index == obj_peasanto) 
	    sprite_index = spr_peasanto_attack
	scr_collide()



}
