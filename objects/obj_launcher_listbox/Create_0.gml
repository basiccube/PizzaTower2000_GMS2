func = -4
items = []
selected = 0
size = 24

addItem = function(text, arr)
{
	var sprw = sprite_get_width(spr_launcher_button)
	var sprh = sprite_get_height(spr_launcher_button)
	
	var xscale = sprite_width / sprw
	var yscale = size / sprh
	
	var pos = array_length(items)
	var bx = x
	var by = y + (pos * size)
	with (instance_create_depth(bx, by, depth - 1, obj_launcher_listitem))
	{
		self.text = text
		func = other.func
		funcarg = arr
		
		image_xscale = xscale
		image_yscale = yscale
		
		self.pos = pos
		parentID = other.id
		array_push(other.items, id)
	}
}

executeSelected = function()
{
	with (items[selected])
		func(funcarg)
}