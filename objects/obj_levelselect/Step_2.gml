// Go to room if -room arguments have been specified
if (global.startRoom != "")
{
    with (obj_room)
        other.targetRoom = variable_instance_get(id, global.startRoom)
            
    with (obj_player)
    {
        targetDoor = global.startDoor
        targetRoom = other.targetRoom
        state.change(PLAYER_NORMAL)
    }
      
    room_goto(obj_player.targetRoom)
}
