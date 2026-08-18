if !global.tomatofollow
{
	level_collect_pizzakin()
	instance_create(x, y, obj_pizzakinFollowerTomato)
	instance_destroy()
	global.tomatofollow = true
}