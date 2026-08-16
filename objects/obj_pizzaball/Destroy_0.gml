spawncount = 0
if (global.golfhit < 10)
    spawncount = 10
else if (global.golfhit < 20)
    spawncount = 5
else if (global.golfhit < 30)
    spawncount = 1
    
if (global.golfhit < 30)
{
    repeat (spawncount)
    {
        with (instance_create(x + 16, y - 24, obj_pizzaslice))
        {
            hsp = choose(-3, -2, -1, 1, 2, 3)
            vsp = choose(-10, -9, -8, -7, -6, -5, -4, -3, -2)
        }
    }
}
    
with (obj_pizzaballblock)
    instance_destroy()
    
global.golfhit = 0
event_inherited()
