function con_showcollisions(args)
{
	showCollisions = console_bool(args, showCollisions)
	update_collision_visibility()
	save_config()
}

function con_debuginfo(args)
{
	debugInfo = console_bool(args, debugInfo)
	save_config()
}

function con_panic(args)
{
	var mins = 3
	var secs = 30
	
	var len = array_length(args)
	if (len > 1)
	{
		var minstr = string_digits(args[1])
		if (minstr != "")
			mins = real(minstr)
		
		if (len > 2)
		{
			var secstr = string_digits(args[2])
			if (secstr != "")
				secs = real(secstr)
		}
	}
	
	global.panic = !global.panic
	global.minutes = mins
	global.seconds = secs
}