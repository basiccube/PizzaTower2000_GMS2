#macro PLAYER_NORMAL "normal"
#macro PLAYER_JUMP "jump"
#macro PLAYER_LADDER "ladder"
#macro PLAYER_CROUCH "crouch"

#macro PLAYER_FREEFALL "freefall"
#macro PLAYER_FREEFALLLAND "freefallLand"
#macro PLAYER_FREEFALLPREP "freefallPrep"

#macro PLAYER_MACH1 "mach1"
#macro PLAYER_MACH2 "mach2"
#macro PLAYER_MACH3 "mach3"
#macro PLAYER_MACHSLIDE "machSlide"
#macro PLAYER_MACHROLL "machRoll"
#macro PLAYER_CLIMBWALL "climbWall"

#macro PLAYER_SUPLEXDASH "suplexDash"
#macro PLAYER_CROUCHSLIDE "crouchSlide"

#macro PLAYER_SUPERJUMP "superJump"
#macro PLAYER_SUPERJUMPPREP "superJumpPrep"

#macro PLAYER_GRAB "grab"
#macro PLAYER_CHARGE "charge"
#macro PLAYER_SUPERSLAM "superSlam"

#macro PLAYER_TAUNT "taunt"
#macro PLAYER_PARRY "parry"

#macro PLAYER_KNIGHT "knight"
#macro PLAYER_KNIGHTSLIDE "knightSlide"
#macro PLAYER_KNIGHTATTACK "knightAttack"
#macro PLAYER_BOMB "bomb"
#macro PLAYER_TUMBLE "tumble"

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
#macro PLAYER_MENU "menu"
#macro PLAYER_SCOOTERSLIDE "scooterSlide"
#macro PLAYER_ANIMATION "animation"

function scr_player_initStates()
{
	StateOverride(id)
	
	stateDummy = new State()
	state.add(PLAYER_DUMMY, stateDummy)
	
	stateNormal = new State(scr_playerState_normal, func_empty, scr_playerState_normal_leave)
	state.add(PLAYER_NORMAL, stateNormal)
	
	stateJump = new State(scr_playerState_jump, func_empty, scr_playerState_jump_leave)
	state.add(PLAYER_JUMP, stateJump)
	
	stateLadder = new State(scr_playerState_ladder)
	state.add(PLAYER_LADDER, stateLadder)
	
	stateCrouch = new State(scr_playerState_crouch, scr_playerState_crouch_enter)
	state.add(PLAYER_CROUCH, stateCrouch)
	
	stateFreefall = new State(scr_playerState_freefall, func_empty, scr_playerState_freefall_leave)
	state.add(PLAYER_FREEFALL, stateFreefall)
	
	stateFreefallLand = new State(scr_playerState_freefallLand, scr_playerState_freefallLand_enter)
	state.add(PLAYER_FREEFALLLAND, stateFreefallLand)
	
	stateFreefallPrep = new State(scr_playerState_freefallPrep, scr_playerState_freefallPrep_enter)
	state.add(PLAYER_FREEFALLPREP, stateFreefallPrep)
	
	stateMach1 = new State(scr_playerState_mach1, scr_playerState_mach1_enter)
	state.add(PLAYER_MACH1, stateMach1)
	
	stateMach2 = new State(scr_playerState_mach2)
	state.add(PLAYER_MACH2, stateMach2)
	
	stateMachSlide = new State(scr_playerState_machSlide)
	state.add(PLAYER_MACHSLIDE, stateMachSlide)
	
	stateSuplexDash = new State(scr_playerState_suplexDash, scr_playerState_suplexDash_enter)
	state.add(PLAYER_SUPLEXDASH, stateSuplexDash)
	
	stateCrouchSlide = new State(scr_playerState_crouchSlide, scr_playerState_crouchSlide_enter, scr_playerState_crouchSlide_leave)
	state.add(PLAYER_CROUCHSLIDE, stateCrouchSlide)
	
	stateTaunt = new State(scr_playerState_taunt)
	state.add(PLAYER_TAUNT, stateTaunt)
	
	stateParry = new State(scr_playerState_parry)
	state.add(PLAYER_PARRY, stateParry)
	
	stateBump = new State(scr_playerState_bump, scr_playerState_bump_enter)
	state.add(PLAYER_BUMP, stateBump)
	
	stateCeilingHit = new State(scr_playerState_ceilingHit)
	state.add(PLAYER_CEILINGHIT, stateCeilingHit)
	
	stateEnterDoor = new State(scr_playerState_enterDoor, scr_playerState_enterDoor_enter)
	state.add(PLAYER_ENTERDOOR, stateEnterDoor)
	
	stateExitDoor = new State(scr_playerState_exitDoor, scr_playerState_exitDoor_enter)
	state.add(PLAYER_EXITDOOR, stateExitDoor)
	
	stateGateShut = new State(scr_playerState_gateShut, scr_playerState_gateShut_enter)
	state.add(PLAYER_GATESHUT, stateGateShut)
	
	stateVictory = new State(scr_playerState_victory)
	state.add(PLAYER_VICTORY, stateVictory)
	
	stateHurt = new State(scr_playerState_hurt)
	state.add(PLAYER_HURT, stateHurt)
	
	stateTimesUp = new State(scr_playerState_timesUp)
	state.add(PLAYER_TIMESUP, stateTimesUp)
	
	stateGameOver = new State(scr_playerState_gameOver)
	state.add(PLAYER_GAMEOVER, stateGameOver)
	
	stateMenu = new State(scr_playerState_menu)
	state.add(PLAYER_MENU, stateMenu)
	
	stateAnimation = new State(scr_playerState_animation, func_empty, scr_playerState_animation_leave)
	state.add(PLAYER_ANIMATION, stateAnimation)
	
	stateScooterSlide = new State(scr_playerState_scooterSlide)
	state.add(PLAYER_SCOOTERSLIDE, stateScooterSlide)
	
	StateOverride(noone)
}