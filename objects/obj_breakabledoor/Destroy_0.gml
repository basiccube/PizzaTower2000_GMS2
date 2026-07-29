if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (!global.highperformance)
    {
        instance_create((x + 16), (y + 50), obj_wooddebris)
        instance_create((x + 16), (y + 50), obj_wooddebris)
        instance_create((x + 16), (y + 50), obj_wooddebris)
        instance_create((x + 16), (y + 50), obj_wooddebris)
        instance_create((x + 16), (y + 50), obj_wooddebris)
        instance_create((x + 16), (y + 50), obj_wooddebris)
    }
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    snd_play(sfx_breakblock)
    ds_list_add(global.saveroom, id)
}
