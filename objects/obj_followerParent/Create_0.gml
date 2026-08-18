collision_init()
useCollisions = true
dir = sign(image_xscale)

followID = obj_player
prevFollowX = x
prevFollowY = y

offsetX = 0
offsetY = 0

spacing = 25
spacingFactor = 0
spacingAccel = 0.2

queue = ds_queue_create()
queueSteps = 20

follower_add()