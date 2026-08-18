function stats_reset()
{
	global.collect = 0
	global.treasure = false
	global.key = false
	
	global.shroomfollow = false
	global.cheesefollow = false
	global.tomatofollow = false
	global.sausagefollow = false
	global.pineapplefollow = false
	global.toppintotal = 0
	
	global.combo = 0
	global.combotime = 0
	
	global.pizzacoin = 0
	global.golfhit = 0
}

function level_set_srank(num)
{
	global.srank = num
	global.arank = num - (num / 4)
	global.brank = num - ((num / 4) * 2)
	global.crank = num - ((num / 4) * 3)
}

function level_collect_pizzakin()
{
	global.toppintotal++
	var msg = "YOU HAVE ALL TOPPINS!"
	if (global.toppintotal < 5)
		msg = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!"
		
	with (obj_tv)
	{
		message = msg
		showtext = true
		alarm[0] = 150
	}
	
	global.style += 10
	global.combotime = 60
	snd_play(sfx_collecttoppin)
}