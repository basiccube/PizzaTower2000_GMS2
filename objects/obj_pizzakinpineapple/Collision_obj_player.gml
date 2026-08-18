if !global.pineapplefollow
{
	level_collect_pizzakin()
	instance_create(x, y, obj_pizzakinFollowerPineapple)
	instance_destroy()
	global.pineapplefollow = true
}