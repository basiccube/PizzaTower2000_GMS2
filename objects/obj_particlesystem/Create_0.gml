if (instance_number(object_index) > 1)
{
    instance_destroy()
    exit;
}

global.particle_system = part_system_create()
global.part_emitter = part_emitter_create(global.particle_system)
global.part_map = ds_map_create()
global.part_depth = ds_map_create()

cloudeffect = declare_particle("cloudeffect", spr_cloudeffect, 0.5, -6)
part_type_speed(cloudeffect, 0, 0, 0, 0)
highjumpcloud = declare_particle("highjumpcloud", spr_highjumpcloud, 0.5, 0)
part_type_speed(highjumpcloud, 0, 0, 0, 0)
