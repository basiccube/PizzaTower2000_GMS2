
with (obj_player)
{
    if (keyUp_held && (state == 0 || state == 60 || state == 61 || state == 81) && y == (other.y + 50) && (!instance_exists(obj_transition)) && state != 69 && state != 52)
    {
		var str = get_string("Enter room name to go to:", "hub_1")
		var doorstr = get_string("Enter door for starting position:", "A")
		var rm = variable_instance_get(obj_room.id, str)
		
		targetRoom = rm
        targetDoor = doorstr
		
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = 0
        instance_create(x, y, obj_transition)
    }
}
