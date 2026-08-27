if use_global
	toggled = variable_global_get(global_var)
else
{
	ini_open(ini_file)
	toggled = (ini_read_real(ini_section, ini_key, false) > 0)
	ini_close()
}