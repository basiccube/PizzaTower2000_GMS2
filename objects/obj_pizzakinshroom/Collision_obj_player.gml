if !global.shroomfollow
{
	level_collect_pizzakin()
	instance_create(x, y, obj_pizzakinFollowerShroom)
	instance_destroy()
	global.shroomfollow = true
}