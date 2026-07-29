grav = 0.5
hsp = 0
vsp = 0

xscale = 1
yscale = 1

depth = -15
sprite_index = spr_player_crouchslide
visible = true

facehurt = 1
steppy = 0
movespeed = 19
grounded = 1
jumpstop = 0
start_running = 1

state = 62
move = 0

// creation code works stupidly so this is done here instead
if (room == levelselect)
    state = 1

turn = 0
jumpAnim = 1
dashAnim = 1
landAnim = 0
machslideAnim = 0
moveAnim = 1
stopAnim = 1
crouchslideAnim = 1
crouchslipbuffer = 0
crouchAnim = 1
machhitAnim = 0
stompAnim = 0
inv_frames = 0
turning = 0
hurtbounce = 0
hurted = 0
mach2 = 0
input_buffer_jump = 8
player_x = x
player_y = y
targetRoom = obj_room.hub_1
targetDoor = "A"
flash = false
global.key_inv = 0
global.shroomfollow = 0
global.cheesefollow = 0
global.tomatofollow = 0
global.sausagefollow = 0
global.pineapplefollow = 0
global.keyget = 0
global.collect = 0
global.ammo = 0
global.treasure = 0
global.combo = 0
global.combotime = 0
global.pizzacoin = 0
global.toppintotal = 1
global.golfhit = 0
global.hit = 0
global.leveltosave = -4
in_water = 0
key_particles = 0
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
toomuchalarm2 = 0
idleanim = 0
momemtum = 0
cutscene = 0
grabbing = 0
dir = xscale
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
timeuntilhpback = 300
baddiegrabbedID = 0
hallway = 0
hallwaydirection = 0

// sound stuff
snd_mach1playing = false
snd_mach2playing = false
snd_mach3playing = false

// taunt and parry
tauntstoredmovespeed = 8
tauntstoredsprite = spr_player_idle
tauntstoredstate = 0
taunttimer = 20
taunt_to_parry_max = 10
parry_max = 8
parry = 0
parry_count = 0
parry_inst = -4

ini_open("character.ini")
name = string_upper(ini_read_string("Character", "Name", "Peppino"))
machfreefallanim = ini_read_real("Character", "UseMachFreefall", 1)
grabturnboost = ini_read_real("Character", "GrabTurnBoost", 0)
knightattacktype = ini_read_real("Character", "KnightAttackType", 0)

piledriveranim = ini_read_real("Piledriver", "PiledriverAnim", 1)
piledriverx = ini_read_real("Piledriver", "PiledriverXOffset", 0)
piledrivery = ini_read_real("Piledriver", "PiledriverYOffset", 0)
ini_close()
