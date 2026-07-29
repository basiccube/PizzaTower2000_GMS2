if (global.panic == 1)
{
    with (obj_player)
    {
        if (grounded && x > (other.x + 32) && x < (other.x + 160) && keyUp_held && (state == 0 || state == 60 || state == 61 || state == 81) && state != 69)
        {
            state = 69
            image_index = 0
            targetDoor = "none"
            
            if (!is_string(global.leveltosave))
            {
                global.leveltosave = "level"
                global.srank = 10000
                global.arank = global.srank - (global.srank / 4)
                global.brank = global.srank - ((global.srank / 4) * 2)
                global.crank = global.srank - ((global.srank / 4) * 3)
            }
            
            if (global.collect >= global.srank)
                global.rank = "s"
            else if (global.collect > global.arank)
                global.rank = "a"
            else if (global.collect > global.brank)
                global.rank = "b"
            else if (global.collect > global.crank)
                global.rank = "c"
            else
                global.rank = "d"
            
            ini_open("saveData.ini")
            if (global.rank == "s")
                ini_write_string("Ranks", global.leveltosave, global.rank)
            if (global.rank == "a" && "s" != ini_read_string("Ranks", global.leveltosave, "none"))
                ini_write_string("Ranks", global.leveltosave, global.rank)
            if (global.rank == "b" && "s" != ini_read_string("Ranks", global.leveltosave, "none") && "a" != ini_read_string("Ranks", global.leveltosave, "none"))
                ini_write_string("Ranks", global.leveltosave, global.rank)
            if (global.rank == "c" && "s" != ini_read_string("Ranks", global.leveltosave, "none") && "a" != ini_read_string("Ranks", global.leveltosave, "none") && "b" != ini_read_string("Ranks", global.leveltosave, "none"))
                ini_write_string("Ranks", global.leveltosave, global.rank)
            if (global.rank == "d" && "s" != ini_read_string("Ranks", global.leveltosave, "none") && "a" != ini_read_string("Ranks", global.leveltosave, "none") && "b" != ini_read_string("Ranks", global.leveltosave, "none") && "c" != ini_read_string("Ranks", global.leveltosave, "none"))
                ini_write_string("Ranks", global.leveltosave, global.rank)
            ini_close()
            
            if (!instance_exists(obj_endlevelfade))
                instance_create(x, y, obj_endlevelfade)
        }
    }
}
