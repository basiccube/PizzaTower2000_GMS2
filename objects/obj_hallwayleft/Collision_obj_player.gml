with (obj_player)
{
    if (!instance_exists(obj_transition))
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        hallway = 1
        hallwaydirection = -1
        other.visited = 1
        image_index = 0
        if (state == 62)
            state = 0
        instance_create(x, y, obj_transition)
    }
}
