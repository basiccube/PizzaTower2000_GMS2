if (obj_player.state == 0 && obj_player.keyUp_held && global.key_inv == 1 && place_meeting(x, y, obj_player))
{
    ds_list_add(global.saveroom, id)
    snd_play(sfx_bump)
    obj_player.state = 55
    obj_player.image_index = 0
    image_index = 0
    sprite_index = spr_doorkeyopen
    image_speed = 0.35
    global.key_inv = 0
}
with (obj_player)
{
    if (place_meeting(x, y, obj_keydoor) && other.sprite_index == spr_doorvisited && keyUp_held && (state == 0 || state == 60 || state == 61 || state == 81) && y == (other.y + 50) && (!instance_exists(obj_transition)) && state != 69 && state != 55 && state != 52)
    {
        mach2 = 0
        image_index = 0
        obj_camera.chargecamera = 0
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        state = 69
        instance_create(x, y, obj_transition)
    }
}
if (floor(image_index) == 2)
    image_speed = 0
if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == 55)
{
    with (obj_player)
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_transition))
            instance_create(x, y, obj_transition)
    }
}
if place_meeting(x, y, obj_doorA)
    targetDoor = "A"
if place_meeting(x, y, obj_doorB)
    targetDoor = "B"
if place_meeting(x, y, obj_doorC)
    targetDoor = "C"
if place_meeting(x, y, obj_doorD)
    targetDoor = "D"
if place_meeting(x, y, obj_doorE)
    targetDoor = "E"
