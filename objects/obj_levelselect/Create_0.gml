level_list = ds_list_create()
levelname_list = ds_list_create()
levelroom_list = ds_list_create()

plifile = file_find_first("levels\\*.pli", 0)
while (plifile != "")
{
    ds_list_add(level_list, plifile)
    
    ini_open("levels\\" + plifile)
    ds_list_add(levelname_list, ini_read_string("Level", "Name", ""))
    ds_list_add(levelroom_list, ini_read_string("Level", "Room", ""))
    ini_close()
    
    plifile = file_find_next()
}
file_find_close()

selection = 0
