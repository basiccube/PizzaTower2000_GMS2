if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

collision_init()
depth = -15

xscale = 1
yscale = 1
dir = xscale
movespeed = 0

state = new StateMachine(PLAYER_DUMMY)
scr_player_initStates()

input_buffer_jump = 0

flash = false
facehurt = false
steppy = false
jumpStop = false

jumpAnim = false
landAnim = false
stompAnim = false
crouchAnim = false
machslideAnim = false
machhitAnim = false

idleTimer = 0
windingAnim = 0
freefallAnimTimer = 0

momentum = false
cutscene = false

ladderBuffer = 0
crouchSlideBuffer = 0
suplexDash = false
freefallSlam = 0

hurt = false
hurtTimer = 0

targetRoom = undefined
targetDoor = "A"

hallway = false
hallwayDirection = 0

tauntStoredMovespeed = 8
tauntStoredSprite = spr_player_idle
tauntStoredState = PLAYER_DUMMY
tauntTimer = 20

tauntToParryMax = 10
parryMax = 8
parryCount = 0
parryInstance = noone

mach2EffectTimer = 0
mach2EffectTimerMax = 5

mach3EffectTimer = 0
mach3EffectTimerMax = 6

animStopOnGround = false
animSlowDown = false

crouchMaskStates = [
	PLAYER_CROUCH,
	PLAYER_CROUCHSLIDE,
]

drawOverride = [
	obj_mach2effect,
	obj_mach3effect,
	obj_superslameffect,
	obj_taunteffect
]
drawOverrideLength = array_length(drawOverride)

ini_open("character.ini")

name = string_upper(ini_read_string("Character", "Name", "Peppino"))
useMachFreefallAnim = ini_read_real("Character", "UseMachFreefall", 1)
grabTurnBoost = ini_read_real("Character", "GrabTurnBoost", 0)
knightAttackType = ini_read_real("Character", "KnightAttackType", 0)

piledriverAnim = ini_read_real("Piledriver", "PiledriverAnim", 1)
piledriverX = ini_read_real("Piledriver", "PiledriverXOffset", 0)
piledriverY = ini_read_real("Piledriver", "PiledriverYOffset", 0)

ini_close()