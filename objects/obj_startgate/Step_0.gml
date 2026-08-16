// Read level name from level info file
var path = "levels/" + level + ".pli"
if (file_exists(path) && name == "")
{
	ini_open(path)
	name = ini_read_string("Level", "Name", "")
	ini_close()
}