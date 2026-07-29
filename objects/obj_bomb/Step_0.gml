countdown -= 0.5
if (scr_solid(x + 1, y) || scr_solid(x - 1, y))
    grav = 0.5
if (grounded && grav != 0)
    hsp = 0
if (countdown < 50)
    sprite_index = spr_bomblit
if (countdown == 0)
{
    snd_play(sfx_explode)
    instance_destroy()
    instance_create(x, y, obj_bombexplosion)
}
scr_collide()
