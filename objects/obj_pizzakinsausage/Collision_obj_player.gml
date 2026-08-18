if !global.sausagefollow
{
	level_collect_pizzakin()
	instance_create(x, y, obj_pizzakinFollowerSausage)
	instance_destroy()
	global.sausagefollow = true
}