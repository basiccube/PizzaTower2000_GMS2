image_speed = 0.35
if (floor(image_index) == image_number - 1)
	image_speed = 0

switch global.rank
{
	case "s": sprite_index = spr_rankS; break;
	case "a": sprite_index = spr_rankA; break;
	case "b": sprite_index = spr_rankB; break;
	case "c": sprite_index = spr_rankC; break;
	case "d": sprite_index = spr_rankD; break;
}

if (statsalpha < 1)
	statsalpha += 0.1