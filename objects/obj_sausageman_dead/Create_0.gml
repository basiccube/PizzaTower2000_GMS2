hsp = irandom_range(5, 10) * sign(x - obj_player.x)
vsp = irandom_range(-5, -10)
grav = 0.4

alarm[0] = 5
if (x != obj_player.x)
	image_xscale = -sign(x - obj_player.x)