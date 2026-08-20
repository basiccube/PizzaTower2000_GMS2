update_camera()

if !instance_exists(obj_player)
	exit;

if (obj_player.y < 200 && obj_player.x < 200)
	player_yoffset = approach(player_yoffset, -300, 15)
else
	player_yoffset = approach(player_yoffset, 0, 15)

if global.hud
	exit;

switch obj_player.state.get_current_state()
{
	case PLAYER_CEILINGHIT:
		peppino_sprite = spr_hud_stun
		break
	case PLAYER_FREEFALLLAND:
		if (shake_mag > 0)
			peppino_sprite = spr_hud_stun
		break
	
	case PLAYER_GETKEY:
	case PLAYER_TREASURE:
		peppino_sprite = spr_hud_happy
		break
		
	case PLAYER_MACH1:
	case PLAYER_TUMBLE:
	case PLAYER_FREEFALLPREP:
	case PLAYER_FREEFALL:
	case PLAYER_SUPERJUMP:
	case PLAYER_SUPERJUMPPREP:
	case PLAYER_GRAB:
		peppino_sprite = spr_hud_mach1
		break
		
	case PLAYER_MACH2:
	case PLAYER_SUPLEXDASH:
		peppino_sprite = spr_hud_mach2
		break
		
	case PLAYER_MACH3:
	case PLAYER_MACHROLL:
		peppino_sprite = spr_hud_mach3
		break
		
	case PLAYER_HURT:
	case PLAYER_TIMESUP:
	case PLAYER_BOMB:
		peppino_sprite = spr_hud_hurt
		break
		
	case PLAYER_KNIGHT:
	case PLAYER_KNIGHTSLIDE:
	case PLAYER_KNIGHTATTACK:
		peppino_sprite = spr_hud_knightpep
		break
		
	default:
		peppino_sprite = spr_hud_normal
}

if (peppino_sprite == spr_hud_normal)
{
	switch obj_player.sprite_index
	{
		case spr_player_victory:
			peppino_sprite = spr_hud_happy
			break
			
		case spr_player_punch:
		case spr_player_punchUp:
			peppino_sprite = spr_hud_mach1
			break
			
		case spr_player_machSlideBoost:
			peppino_sprite = spr_hud_mach2
			break
		
		case spr_player_machSlideBoost3:
			peppino_sprite = spr_hud_mach3
			break
			
		case spr_player_scream:
			peppino_sprite = spr_hud_hurt
			break
	}
}


var speedbarStates = [PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3, PLAYER_WALLCLIMB, PLAYER_MACHSLIDE, PLAYER_MACHROLL, PLAYER_SUPLEXDASH]
if obj_player.state.is(speedbarStates)
{
	if (obj_player.movespeed < 2.4)
	{
		speedbar_sprite = spr_speedbar
		speedbar_index = 0
	}
	else if (obj_player.movespeed < 4.8)
	{
		speedbar_sprite = spr_speedbar
		speedbar_index = 1
	}
	else if (obj_player.movespeed < 7.2)
	{
		speedbar_sprite = spr_speedbar
		speedbar_index = 2
	}
	else if (obj_player.movespeed < 9.6)
	{
		speedbar_sprite = spr_speedbar
		speedbar_index = 3
	}
	else if (obj_player.movespeed < 12)
	{
		speedbar_sprite = spr_speedbar
		speedbar_index = 4
	}
	else
	{
		speedbar_sprite = spr_speedbarmax
		speedbar_index = -1
	}
}
else
{
	speedbar_sprite = spr_speedbar
	speedbar_index = 0
}