// Read level name from level info file
if (file_exists("levels\\" + level + ".pli") && name == "")
{
    tempini_open("levels\\" + level + ".pli")
    name = ini_read_string("Level", "Name", "")
    tempini_close()
}

