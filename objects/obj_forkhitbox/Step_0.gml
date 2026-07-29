if (!instance_exists(ID))
    instance_destroy()
if instance_exists(ID)
{
    x = ID.x
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if (object_index == obj_forknight)
        {
            if (state != 84 && state != 91)
            {
                hitboxcreate = 0
                with (other.id)
                    instance_destroy()
            }
        }
        if (object_index == obj_peasanto)
        {
            if (state != 85)
            {
                hitboxcreate = 0
                with (other.id)
                    instance_destroy()
            }
        }
    }
}
