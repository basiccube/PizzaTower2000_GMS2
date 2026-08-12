if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

depth = -15

hsp = 0
vsp = 0
grav = 0.5
grounded = true

xscale = 1
yscale = 1
movespeed = 19

facehurt = true
steppy = false
jumpstop = false

state = 1
move = 0

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
flash = false
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
momemtum = 0
cutscene = 0
grabbing = 0
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
timeuntilhpback = 300
baddiegrabbedID = 0

// sound stuff
snd_mach1playing = false
snd_mach2playing = false
snd_mach3playing = false