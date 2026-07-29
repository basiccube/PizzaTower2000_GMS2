function tempini_open(argument0) {
	// tempini_open(file_name)

	var inifile;

	inifile = argument0
	global.tempini = "_temp_ini_" + filename_name(inifile)
	file_copy(inifile, global.tempini)
	ini_open(global.tempini)



}
