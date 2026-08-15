function scr_playerstates() {
	switch state
	{
	    case 85:
	        scr_player_charge()
	        break
	    case 8:
	        scr_player_climbwall()
	        break
	    case 9:
	        scr_player_knightpepslopes()
	        break
	    case 14:
	        scr_player_gottreasure()
	        break
	    case 15:
	        scr_player_knightpep()
	        break
	    case 16:
	        scr_player_knightpepattack()
	        break
	    case 18:
	        scr_player_bombpep()
	        break
	    case 28:
	        scr_player_machroll()
	        break
	    case 29:
	        scr_player_tumble()
	        break
	    case 34:
	        scr_player_superslam()
	        break
	    case 37:
	        scr_player_grab()
	        break
	    case 46:
	        scr_player_gameover()
	        break
	    case 47:
	        scr_player_keyget()
	        break
	    case 48:
	        scr_player_tackle()
	        break
	    case 55:
	        scr_player_victory()
	        break
	    case 54:
	        scr_player_Sjump()
	        break
	    case 56:
	        scr_player_Sjumpprep()
	        break
	    case 61:
	        scr_player_mach2()
	        break
	    case 81:
	        scr_player_mach3()
	        break
	    case 63:
	        scr_player_bump()
	        break
	}
}