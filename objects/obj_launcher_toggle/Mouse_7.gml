toggled = !toggled

ini_open(ini_file)
ini_write_real(ini_section, ini_key, toggled)
ini_close()