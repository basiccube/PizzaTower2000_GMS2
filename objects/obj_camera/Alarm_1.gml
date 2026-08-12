if !timestop
{
	global.seconds--
	if (global.seconds < 0)
	{
		global.seconds = 59
		global.minutes--
	}
}

alarm[1] = 60
