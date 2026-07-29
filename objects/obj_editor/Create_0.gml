#macro EDITOR_VERSION "0.9 (GMS2)"

global.objects = ds_list_create()
global.backgrounds = ds_list_create()
global.backgroundnames = ds_list_create()
global.tilesets = ds_list_create()
global.tilesetnames = ds_list_create()
global.music = ds_list_create()

ini_open("editor/config.ini")
gamepath = ini_read_string("Config", "GamePath", ".\\")
ini_close()

maxobjsections = 2
ini_open("editor/objects.ini")
for (i = 0; i < maxobjsections; i += 1)
{
    if (ini_section_exists(string(i)))
    {
        if (ini_key_exists(string(i), "Object"))
        {
            ds_list_add(global.objects, ini_read_string(string(i), "Object", "obj_wall"))
            if (file_exists("editor\\sprites\\" + ini_read_string(string(i), "Object", "spr_doesntexist") + ".png"))
                global.objspr[i] = sprite_add("editor\\sprites\\" + ini_read_string(string(i), "Object", "spr_doesntexist") + ".png", 1, true, false, ini_read_real(string(i), "XOrigin", 0), ini_read_real(string(i), "YOrigin", 0))
            else
                global.objspr[i] = spr_object
            global.objbuttonspr[i] = sprite_add("editor\\sprites\\" + ini_read_string(string(i), "Object", "spr_doesntexist") + "_objbutton.png", 1, true, false, 0, 0)
            if (ini_key_exists(string(i), "Variables"))
                global.objvar[i] = ini_read_string(string(i), "Variables", "")
            else
                global.objvar[i] = ""
            if (ini_key_exists(string(i), "Variables2"))
                global.objvar2[i] = ini_read_string(string(i), "Variables2", "")
            else
                global.objvar2[i] = ""
        }
    }
    if (ini_section_exists(string(i + 1)))
        maxobjsections += 1
}
ini_close()

musicfile = file_text_open_read("editor\\music.txt")
while (!file_text_eof(musicfile))
{
    ds_list_add(global.music, file_text_read_string(musicfile))
    file_text_readln(musicfile)
}
file_text_close(musicfile)

if (directory_exists("bg"))
{
    bgfile = file_find_first("bg\\*.png", 0)
    while (bgfile != "")
    {
        ds_list_add(global.backgrounds, sprite_add("bg\\" + bgfile, 0, false, false, 0, 0))
        ds_list_add(global.backgroundnames, filename_change_ext(bgfile, ""))
        bgfile = file_find_next()
    }
    file_find_close()
}

if (directory_exists("tilesets"))
{
    tilefile = file_find_first("tilesets\\*.png", 0)
    while (tilefile != "")
    {
        ds_list_add(global.tilesets, sprite_add("tilesets\\" + tilefile, 0, true, false, 0, 0))
        ds_list_add(global.tilesetnames, filename_change_ext(tilefile, ""))
        tilefile = file_find_next()
    }
    file_find_close()
}

roomw = 800
roomh = 544
roomname = "room_1"

selectedobj = ""
selectedspr = spr_object
selectedvar = ""
selectedvar2 = ""

setmusic = ds_list_find_value(global.music, 0)
roombg = ds_list_find_value(global.backgrounds, 0)
roombgname = ds_list_find_value(global.backgroundnames, 0)
selectedtileset = ds_list_find_value(global.tilesets, 0)
selectedtilesetname = ds_list_find_value(global.tilesetnames, 0)
mode = 0

gridsize = 32
gridmovex = (mouse_x - 16)
gridmovey = (mouse_y - 16)

global.playexport = false
tilevisible = true
uibuffer = 0
msgalpha = 0
showmsg = true
alarm[0] = 320
msg = "Welcome to Pizza Builder. To open the toolbar press ESC."
