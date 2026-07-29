targetDoorObject = -4
if (targetDoor == "A")
    targetDoorObject = obj_doorA
else if (targetDoor == "B")
    targetDoorObject = obj_doorB
else if (targetDoor == "C")
    targetDoorObject = obj_doorC
else if (targetDoor == "D")
    targetDoorObject = obj_doorD
else if (targetDoor == "E")
    targetDoorObject = obj_doorE

if (targetDoorObject != -4 && instance_exists(targetDoorObject))
{
    if (hallway == 1)
        x = targetDoorObject.x + (hallwaydirection * 100)
    else
        x = targetDoorObject.x + 16
    y = targetDoorObject.y - 14
    hallway = 0
}

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
	if (toppin[0] && !instance_exists(toppin[1]))
		instance_create(x, y, toppin[1])
}