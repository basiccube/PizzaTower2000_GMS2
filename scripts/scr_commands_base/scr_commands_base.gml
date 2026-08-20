function console_bool(args, value)
{
	value = !value
	if (array_length(args) > 1)
	{
		switch args[1]
		{
			case "1":
			case "true":
			case "True":
				value = true
				break
				
			case "0":
			case "false":
			case "False":
				value = false
				break
		}
	}
	
	return value;
}

function con_clear(args)
{ clear_output(); }

function con_echo(args)
{
	var len = array_length(args)
	if (len <= 1)
		exit;
	
	var str = ""
	for (var i = 1, n = array_length(args); i < n; i++)
	{
		str += string(args[i])
		if (i < n - 1)
			str += " "
	}
	
	print_output(str)
}

function con_quit(args)
{ game_end(); }