var toppins = [
	[global.shroomfollow, obj_pizzakinshroom],
	[global.cheesefollow, obj_pizzakincheese],
	[global.tomatofollow, obj_pizzakintomato],
	[global.sausagefollow, obj_pizzakinsausage],
	[global.pineapplefollow, obj_pizzakinpineapple]
]

for (var i = 0, n = array_length(toppins); i < n; i++)
{
	var toppin = toppins[i]
	if (toppin[0] && instance_exists(toppin[1]))
		instance_destroy(toppin[1])
}