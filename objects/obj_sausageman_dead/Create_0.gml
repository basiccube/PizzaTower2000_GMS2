vsp = choose(-5, -6, -7, -8, -9, -10)
hsp = (sign(x - obj_playerOLD.x) * choose(5, 6, 7, 8, 9, 10))
grav = 0.4
alarm[0] = 5
cigar = 0
stomped = 0
if (x != obj_playerOLD.x)
    image_xscale = (-(sign((x - obj_playerOLD.x))))
