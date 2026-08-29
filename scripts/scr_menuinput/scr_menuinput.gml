function scr_menu_initinput()
{
	keyUp_held = false
	keyUp_pressed = false
	
	keyDown_held = false
	keyDown_pressed = false
	
	keyLeft_held = false
	keyLeft_pressed = false
	
	keyRight_held = false
	keyRight_pressed = false
	
	keyConfirm_held = false
	keyConfirm_pressed = false
	
	keyBack_held = false
	keyBack_pressed = false
	
	keyEscape = false
}

function scr_menu_getinput()
{
	if (instance_exists(obj_debugController) && obj_debugController.console_open)
	{
		scr_menu_initinput()
		exit;
	}
	
	var up = vk_up
	keyUp_held = keyboard_check(up)
	keyUp_pressed = keyboard_check_pressed(up)
	
	var down = vk_down
	keyDown_held = keyboard_check(down)
	keyDown_pressed = keyboard_check_pressed(down)
	
	var left = vk_left
	keyLeft_held = -keyboard_check(left)
	keyLeft_pressed = -keyboard_check_pressed(left)
	
	var right = vk_right
	keyRight_held = keyboard_check(right)
	keyRight_pressed = keyboard_check_pressed(right)
	
	var confirm = vk_enter
	keyConfirm_held = keyboard_check(confirm)
	keyConfirm_pressed = keyboard_check_pressed(confirm)
	
	var back = vk_backspace
	keyBack_held = keyboard_check(back)
	keyBack_pressed = keyboard_check_pressed(back)
	
	keyEscape = keyboard_check_pressed(vk_escape)
}