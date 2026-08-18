var states = [PLAYER_KNIGHT, PLAYER_KNIGHTATTACK, PLAYER_KNIGHTSLIDE, PLAYER_HURT]
if !other.state.is(states)
{
	snd_play(sfx_collecttoppin)
	other.state.change(PLAYER_GETKEY)
	
	global.combotime = 60
	global.key = true
	instance_destroy()
}