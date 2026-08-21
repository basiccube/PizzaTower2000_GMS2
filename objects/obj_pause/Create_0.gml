if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

image_speed = 0.35
depth = -500

pause = false
selection = 0
alpha = 0
screensprite = undefined

disabled_rooms = [
	rank_room,
	timesuproom,
	levelselect,
	Realtitlescreen,
	rm_initializer
]

pausedX = SCREEN_WIDTH / 2
pausedStartY = -80
pausedEndY = 120
pausedY = pausedStartY

menuX = SCREEN_WIDTH / 2
menuStartY = SCREEN_HEIGHT + 80
menuEndY = SCREEN_HEIGHT / 2
menuY = menuStartY

pauseGame = function()
{
	pause = true
	instance_deactivate_all(true)
	instance_activate_object(obj_debugController)
}

unpauseGame = function()
{
	pause = false
	instance_activate_all()
}

menu_map = ds_map_create()
menu_string_map = ds_map_create()
menu = []

ds_map_set(menu_string_map, "resume", "RESUME GAME")
ds_map_set(menu_map, "resume", unpauseGame)

ds_map_set(menu_string_map, "exit_level", "EXIT LEVEL")
ds_map_set(menu_map, "exit_level", function()
{
	unpauseGame()
	scr_game_reset()
	scr_delete_pause_image()
})

ds_map_set(menu_string_map, "main_menu", "EXIT TO MAIN MENU")
ds_map_set(menu_map, "main_menu", function()
{
	unpauseGame()
	scr_game_reset()
	scr_delete_pause_image()
	room_goto(Realtitlescreen)
})