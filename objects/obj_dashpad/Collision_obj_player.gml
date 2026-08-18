with (other)
{
	if grounded
	{
		xscale = sign(other.image_xscale)
		machhitAnim = false
		
		flash = true
		state.change(PLAYER_MACH3)
		
		movespeed = 12
		instance_create(x, y, obj_jumpdust)
	}
}