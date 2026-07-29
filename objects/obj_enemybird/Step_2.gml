if ((!instance_exists(ID)))
    instance_destroy()
if (instance_exists(ID))
{
    if (ID.state != 95)
        instance_destroy()
}
