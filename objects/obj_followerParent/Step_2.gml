if (followID == undefined)
	exit;
if !instance_exists(followID)
	exit;

if (followID == obj_player)
	dir = followID.xscale
else
	dir = sign(followID.dir)

if obj_player.state.is([PLAYER_LADDER, PLAYER_ENTERDOOR])
	spacingFactor = approach(spacingFactor, 0, spacingAccel)
else
	spacingFactor = approach(spacingFactor, -1 * dir, spacingAccel)

ds_queue_enqueue(queue, followID.x + (spacing * spacingFactor))
ds_queue_enqueue(queue, followID.y)

if (ds_queue_size(queue) > queueSteps)
{
	var tx = ds_queue_dequeue(queue) + offsetX
	var ty = ds_queue_dequeue(queue) + offsetY
	useCollisions = (prevFollowX == tx && prevFollowY == ty)
	
	if !useCollisions
	{
		x = tx
		y = ty
	}
	
	prevFollowX = tx
	prevFollowY = ty
}

if useCollisions
	scr_collide()