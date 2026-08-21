var doorObject = get_targetdoor_object(targetDoor)
if (doorObject != noone && instance_exists(doorObject))
{
	var dx = doorObject.x + 16
	var dy = doorObject.y - 14
	if hallway
	{
		dx = doorObject.x + (hallwayDirection * 100)
		hallway = false
	}
	
	x = dx
	y = dy
}

roomStartX = x
roomStartY = y