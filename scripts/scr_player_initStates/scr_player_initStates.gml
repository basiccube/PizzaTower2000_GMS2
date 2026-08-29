#macro PLAYER_NORMAL "normal"
#macro PLAYER_JUMP "jump"
#macro PLAYER_LADDER "ladder"
#macro PLAYER_CROUCH "crouch"

#macro PLAYER_MACH1 "mach1"
#macro PLAYER_MACH2 "mach2"
#macro PLAYER_MACH3 "mach3"
#macro PLAYER_MACHSLIDE "machSlide"
#macro PLAYER_MACHROLL "machRoll"
#macro PLAYER_WALLCLIMB "wallClimb"

#macro PLAYER_SUPLEXDASH "suplexDash"
#macro PLAYER_CROUCHSLIDE "crouchSlide"

#macro PLAYER_FREEFALL "freefall"
#macro PLAYER_FREEFALLLAND "freefallLand"
#macro PLAYER_FREEFALLPREP "freefallPrep"

#macro PLAYER_SUPERJUMP "superJump"
#macro PLAYER_SUPERJUMPPREP "superJumpPrep"

#macro PLAYER_GRAB "grab"
#macro PLAYER_CHARGE "charge"
#macro PLAYER_PILEDRIVER "pileDriver"

#macro PLAYER_TAUNT "taunt"
#macro PLAYER_PARRY "parry"

#macro PLAYER_BUMP "bump"
#macro PLAYER_CEILINGHIT "ceilingHit"

#macro PLAYER_ENTERDOOR "enterDoor"
#macro PLAYER_EXITDOOR "exitDoor"
#macro PLAYER_GATESHUT "gateShut"

#macro PLAYER_VICTORY "victory"
#macro PLAYER_TREASURE "treasure"
#macro PLAYER_GETKEY "getKey"

#macro PLAYER_HURT "hurt"
#macro PLAYER_TIMESUP "timesUp"
#macro PLAYER_GAMEOVER "gameOver"

#macro PLAYER_DUMMY "dummy"
#macro PLAYER_NOCLIP "noclip"
#macro PLAYER_ANIMATION "animation"

#macro PLAYER_MENU "menu"
#macro PLAYER_SCOOTERSLIDE "scooterSlide"

// transformations
#macro PLAYER_KNIGHT "knight"
#macro PLAYER_KNIGHTSLIDE "knightSlide"
#macro PLAYER_KNIGHTATTACK "knightAttack"
#macro PLAYER_BOMB "bomb"
#macro PLAYER_TUMBLE "tumble"

function scr_player_initStates()
{
	var add_state = function(name, update = func_empty, enter = func_empty, leave = func_empty)
	{
		var s = new State(update, enter, leave)
		state.add(name, s)
	}
	
	StateOverride(id)
	
	add_state(PLAYER_DUMMY)
	
	// basic movement
	add_state(PLAYER_NORMAL, scr_playerState_normal, func_empty, scr_playerState_normal_leave)
	add_state(PLAYER_JUMP, scr_playerState_jump, func_empty, scr_playerState_jump_leave)
	add_state(PLAYER_LADDER, scr_playerState_ladder)
	add_state(PLAYER_CROUCH, scr_playerState_crouch, scr_playerState_crouch_enter)
	
	// mach
	add_state(PLAYER_MACH1, scr_playerState_mach1, scr_playerState_mach1_enter)
	add_state(PLAYER_MACH2, scr_playerState_mach2)
	add_state(PLAYER_MACH3, scr_playerState_mach3, scr_playerState_mach3_enter)
	add_state(PLAYER_MACHSLIDE, scr_playerState_machSlide)
	add_state(PLAYER_MACHROLL, scr_playerState_machRoll)
	add_state(PLAYER_WALLCLIMB, scr_playerState_wallClimb)
	
	// suplex grab
	add_state(PLAYER_SUPLEXDASH, scr_playerState_suplexDash, scr_playerState_suplexDash_enter)
	add_state(PLAYER_CROUCHSLIDE, scr_playerState_crouchSlide, scr_playerState_crouchSlide_enter, scr_playerState_crouchSlide_leave)
	
	// freefall
	add_state(PLAYER_FREEFALL, scr_playerState_freefall, func_empty, scr_playerState_freefall_leave)
	add_state(PLAYER_FREEFALLLAND, scr_playerState_freefallLand, scr_playerState_freefallLand_enter)
	add_state(PLAYER_FREEFALLPREP, scr_playerState_freefallPrep, scr_playerState_freefallPrep_enter)
	
	// super jump
	add_state(PLAYER_SUPERJUMP, scr_playerState_superJump, scr_playerState_superJump_enter)
	add_state(PLAYER_SUPERJUMPPREP, scr_playerState_superJumpPrep, scr_playerState_superJumpPrep_enter)
	
	// enemy grab
	add_state(PLAYER_GRAB, scr_playerState_grab, scr_playerState_grab_enter)
	add_state(PLAYER_CHARGE, scr_playerState_charge)
	add_state(PLAYER_PILEDRIVER, scr_playerState_piledriver, scr_playerState_piledriver_enter)
	
	// taunting
	add_state(PLAYER_TAUNT, scr_playerState_taunt)
	add_state(PLAYER_PARRY, scr_playerState_parry)
	
	// bump
	add_state(PLAYER_BUMP, scr_playerState_bump, scr_playerState_bump_enter)
	add_state(PLAYER_CEILINGHIT, scr_playerState_ceilingHit, scr_playerState_ceilingHit_enter)
	
	// doors
	add_state(PLAYER_ENTERDOOR, scr_playerState_enterDoor, scr_playerState_enterDoor_enter)
	add_state(PLAYER_EXITDOOR, scr_playerState_exitDoor, scr_playerState_exitDoor_enter)
	add_state(PLAYER_GATESHUT, scr_playerState_gateShut, scr_playerState_gateShut_enter)
	
	// victory
	add_state(PLAYER_VICTORY, scr_playerState_victory, scr_playerState_victory_enter)
	add_state(PLAYER_TREASURE, scr_playerState_treasure, scr_playerState_treasure_enter)
	add_state(PLAYER_GETKEY, scr_playerState_getKey, scr_playerState_getKey_enter)
	
	// hurt
	add_state(PLAYER_HURT, scr_playerState_hurt)
	add_state(PLAYER_TIMESUP, scr_playerState_timesUp)
	add_state(PLAYER_GAMEOVER, scr_playerState_gameOver)
	
	// misc
	add_state(PLAYER_NOCLIP, scr_playerState_noclip)
	add_state(PLAYER_ANIMATION, scr_playerState_animation, func_empty, scr_playerState_animation_leave)
	
	// menu
	add_state(PLAYER_MENU, scr_playerState_menu)
	add_state(PLAYER_SCOOTERSLIDE, scr_playerState_scooterSlide)
	
	// transformations
	add_state(PLAYER_KNIGHT, scr_playerState_knight)
	add_state(PLAYER_KNIGHTSLIDE, scr_playerState_knightSlide, scr_playerState_knightSlide_enter)
	add_state(PLAYER_KNIGHTATTACK, scr_playerState_knightAttack, scr_playerState_knightAttack_enter, scr_playerState_knightAttack_leave)
	add_state(PLAYER_BOMB, scr_playerState_bomb, scr_playerState_bomb_enter)
	add_state(PLAYER_TUMBLE, scr_playerState_tumble)
	
	StateOverride(noone)
}