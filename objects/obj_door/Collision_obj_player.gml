with (obj_player)
{
    if (keyUp_held && (state == 0 || state == 60 || state == 61 || state == 81) && y == (other.y + 50) && (!instance_exists(obj_transition)) && state != 69 && state != 52)
    {
        mach2 = 0
        obj_camera.chargecamera = 0
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        image_index = 0
        state = 69
        instance_create(x, y, obj_transition)
    }
}
