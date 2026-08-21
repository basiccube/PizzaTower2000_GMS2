function con_saveimg(args)
{
	var len = array_length(args)
	if (len <= 2)
		return "saveimg <sprite> <filename>";
	
	var index = asset_get_index(args[1])
	if (index == -1)
		return "error: invalid sprite";
	
	imgbuf_save(index, args[2])
	return "saved image " + args[2];
}

function con_loadimg(args)
{
	var len = array_length(args)
	if (len <= 1)
		return "loadimg <filename>";
	
	var sprite = imgbuf_load(args[1])
	if (sprite == undefined)
		return "failed to load image " + args[1];
	
	with (instance_create(0, 0, obj_null))
		sprite_index = sprite
	
	return "loaded image " + args[1];
}