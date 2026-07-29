function tv_do_expression(sprite)
{
	with (obj_tv)
	{
		if (expressionsprite != sprite)
		{
			state = 1
			expressionsprite = sprite
			sprite_index = spr_newtv_whitenoise
			
			switch expressionsprite
			{
				case spr_newtv_exprhurt:
					expressionbuffer = 60
					break
			}
		}
	}
}