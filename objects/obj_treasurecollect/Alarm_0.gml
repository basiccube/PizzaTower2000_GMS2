obj_player.state = 0
obj_player.image_index = 0
obj_player.sprite_index = spr_player_idle

with (instance_create(x, y, obj_smallnumber))
    number = 1000
global.collect += 1000
global.style += 25
