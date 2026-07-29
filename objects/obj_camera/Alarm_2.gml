// Culling system
alarm[2] = 2
instance_activate_region(__view_get( e__VW.XView, 0 ) - 200, __view_get( e__VW.YView, 0 ) - 200, __view_get( e__VW.WView, 0 ) + 400, __view_get( e__VW.HView, 0 ) + 400, true)
with (obj_baddiecollisionbox)
{
    if (x < __view_get( e__VW.XView, 0 ) - 200 || x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 200 || y < __view_get( e__VW.YView, 0 ) - 200 || y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 200)
    {
        if (instance_exists(baddieID) && !baddieID.thrown)
        {
            instance_deactivate_object(baddieID)
            instance_deactivate_object(id)
        }
    }
}
