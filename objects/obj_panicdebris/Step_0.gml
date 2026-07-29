if (global.panic == 1 && start == 0 && !global.highperformance)
{
    alarm[0] = 15
    start = 1
}
if (global.panic == 0)
    alarm[0] = -1
