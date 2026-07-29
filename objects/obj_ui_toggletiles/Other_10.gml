if (obj_editor.tilevisible)
{
    tile_layer_hide(-5)
    obj_editor.tilevisible = false
}
else if (!obj_editor.tilevisible)
{
    tile_layer_show(-5)
    obj_editor.tilevisible = true
}

with (obj_editor)
{
    if tilevisible
        msg = "Tile visibility enabled"
    else
        msg = "Tile visibility disabled"
    showmsg = true
    alarm[0] = 120
}
with (obj_uibar_button)
    windowopen = false
