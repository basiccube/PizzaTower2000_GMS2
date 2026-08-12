toggled = !toggled
if use_global
	variable_global_set(global_var, toggled)
else
{
	ini_open(ini_file)
	ini_write_real(ini_section, ini_key, toggled)
	ini_close()
}