function scr_collide_destructibles()
{
	if (state == 61 || state == 81 || state == 28 || state == 29 || state == 59 || state == 85)
	{
	    if (place_meeting(x + (hsp * 2), y, obj_destructibles))
	    {
	        with (instance_place(x + (hsp * 2), y, obj_destructibles))
	            instance_destroy()
	        if (state == 61 && machpunchAnim == 0)
	        {
	            machpunchAnim = 1
	            image_index = 0
	        }
	    }
	    if (place_meeting(x + hsp, y, obj_destructibles))
	    {
	        with (instance_place(x + hsp, y, obj_destructibles))
	            instance_destroy()
	        if (state == 61 && machpunchAnim == 0)
	        {
	            machpunchAnim = 1
	            image_index = 0
	        }
	    }
	    if (place_meeting(x + (hsp * 2), y - 1, obj_destructibles))
	    {
	        with (instance_place(x + (hsp * 2), y - 1, obj_destructibles))
	            instance_destroy()
	        if (state == 61 && machpunchAnim == 0)
	        {
	            machpunchAnim = 1
	            image_index = 0
	        }
	    }
	    if (place_meeting(x + (hsp * 2), y + 1, obj_destructibles))
	    {
	        with (instance_place(x + (hsp * 2), y + 1, obj_destructibles))
	            instance_destroy()
	        if (state == 61 && machpunchAnim == 0)
	        {
	            machpunchAnim = 1
	            image_index = 0
	        }
	    }
	}
	if (state == 49 || state == 54 || state == 61 || state == 81 || state == 8)
	{
	    if (place_meeting(x, y - 1, obj_destructibles))
	    {
	        with (instance_place(x, y - 1, obj_destructibles))
	            instance_destroy()
	    }
	}
	if (state == 25)
	{
	    if (place_meeting(x, y + 1, obj_destructibles))
	    {
	        with (instance_place(x, y + 1, obj_destructibles))
	        {
	            with (obj_player)
	            {
	                image_index = 0
	                vsp = -7
	                facestompAnim = 1
	            }
	            instance_destroy()
	        }
	    }
	}
	if (state == 34)
	{
	    if (place_meeting(x, y + 1, obj_destructibles))
	    {
	        with (instance_place(x, y + 1, obj_destructibles))
	            instance_destroy()
	    }
	}
	if (state == 65 || state == 68)
	{
	    if (place_meeting(x, y + vsp + 2, obj_destructibles))
	    {
	        with (instance_place(x, y + vsp + 2, obj_destructibles))
	            instance_destroy()
	    }
	}
	if (state == 13)
	{
	    with (obj_destructibles)
	    {
	        if (place_meeting((x - (obj_player.hsp * 2) - obj_player.xscale), y, obj_player))
	        {
	            with (obj_player)
	            {
	                if (place_meeting(x + (hsp * 2) + xscale, y, obj_bigdestructibles))
	                {
	                    sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4)
	                    image_index = 0
	                    state = 48
	                    movespeed = 4
	                    vsp = -4
	                }
	            }
	            instance_destroy()
	        }
	    }
	}
	
	with (obj_baddie)
	{
	    if (place_meeting(x + (hsp * 2), y, obj_destructibles) && thrown)
	    {
	        with (instance_place(x + (hsp * 2), y, obj_destructibles))
	        {
	            if (object_index != obj_onewayblock && object_index != obj_onewayblock_escape)
	                instance_destroy()
	        }
	    }
	    if (place_meeting(x, y + (vsp * 2), obj_destructibles) && thrown)
	    {
	        with (instance_place(x, y + (vsp * 2), obj_destructibles))
	        {
	            if (object_index != obj_onewayblock && object_index != obj_onewayblock_escape)
	                instance_destroy()
	        }
	    }
	}
}