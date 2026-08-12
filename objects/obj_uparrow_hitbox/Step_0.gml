if !instance_exists(instID)
{
	instance_destroy()
	exit;
}

x = instID.x
y = instID.y

image_xscale = instID.image_xscale
image_yscale = instID.image_yscale

sprite_index = instID.sprite_index
mask_index = instID.mask_index