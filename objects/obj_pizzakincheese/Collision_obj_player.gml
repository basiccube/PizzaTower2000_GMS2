if !global.cheesefollow
{
	level_collect_pizzakin()
	instance_create(x, y, obj_pizzakinFollowerCheese)
	instance_destroy()
	global.cheesefollow = true
}