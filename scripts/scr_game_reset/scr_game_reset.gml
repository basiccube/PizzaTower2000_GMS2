function scr_game_reset()
{
	instance_destroy(obj_timesup)
	instance_destroy(obj_endlevelfade)
	
	global.minutes = 1
	global.seconds = 59
	global.panic = false
	
	global.timedgate = false
	global.leveltosave = undefined
	global.escapesong = "mu_pizzatime"
	
	ds_list_clear(global.saveroom)
	instanceManager.clearInstances()
	stats_reset()
	
	with (obj_player)
	{
		state.change(PLAYER_NORMAL)
		visible = true
		
		for (var i = 0; i <= 11; i++)
			alarm[i] = -1
		
		collision_init()
		
		xscale = 1
		yscale = 1
		dir = xscale
		movespeed = 0
		
		flash = false
		steppy = false
		jumpStop = false
		
		landAnim = false
		machslideAnim = false
		stompAnim = false
		
		idleTimer = 0
		windingAnim = 0
		freefallAnimTimer = 0
		
		momentum = false
		cutscene = false
		
		input_buffer_jump = 0
		
		ladderBuffer = 0
		suplexDash = false
		freefallSlam = 0
		
		hurt = false
		hurtTimer = 0
		
		mach2EffectTimer = 0
		mach3EffectTimer = 0
		
		targetRoom = undefined
		targetDoor = "B"
	}
	
	room_goto(obj_room.hub_1)
	
/*	
	with (obj_playerOLD)
	{
	    hurtbounce = 0
	    key_particles = 0
	    barrel = 0
	    bounce = 0
	    attacking = 0
	    slamming = 0
	    punch = 0
	    grabbing = 0
	    bombpeptimer = 100
	    suplexhavetomash = 0
	}
*/
}