with (obj_playerOLD)
{
    if grounded
    {
        ds_list_add(global.saveroom, other.id) 
        hsp = 0
        vsp = 0
        if (other.sprite_index == other.spridle)
        {
            obj_music.jingle = 1
            snd_play(sfx_treasure)
            other.alarm[0] = 300
        }
        if (other.sprite_index == other.spridle)
            state = 14
        other.sprite_index = other.sprgot
        other.x = obj_playerOLD.x
        other.y = (obj_playerOLD.y - 35)
        obj_tv.showtext = 1
        obj_tv.message = "YOU GOT THE TREASURE!!!"
        obj_tv.alarm[0] = 150
        obj_music.jingle = 1
        global.combotime = 60
    }
}
