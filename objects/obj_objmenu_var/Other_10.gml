with (objid)
{
    varvalue = get_string("Set object variable " + objvar + " to", varvalue)
    if (objvar2 != "")
        varvalue2 = get_string("Set object variable " + objvar2 + " to", varvalue2)
}
with (obj_objmenu)
    instance_destroy()
