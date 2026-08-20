function scr_initinput()
{
	keyUp_held = false
	keyUp_pressed = false
	
	keyDown_held = false
	keyDown_pressed = false
	
	keyLeft_held = false
	keyLeft_pressed = false
	
	keyRight_held = false
	keyRight_pressed = false
	
	keyJump_held = false
	keyJump_pressed = false
	
	keySlap_held = false
	keySlap_pressed = false
	
	keyAttack_held = false
	keyAttack_pressed = false
	
	keyTaunt_held = false
	keyTaunt_pressed = false
	
	keyEscape = false
}

function scr_getinput()
{
	if (instance_exists(obj_debugController) && obj_debugController.console_open)
	{
		scr_initinput()
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
	
	var jump = ord("Z")
	keyJump_held = keyboard_check(jump)
	keyJump_pressed = keyboard_check_pressed(jump)
	
	var slap = ord("X")
	keySlap_held = keyboard_check(slap)
	keySlap_pressed = keyboard_check_pressed(slap)
	
	var attack = vk_shift
	keyAttack_held = keyboard_check(attack)
	keyAttack_pressed = keyboard_check_pressed(attack)
	
	var taunt = ord("C")
	keyTaunt_held = keyboard_check(taunt)
	keyTaunt_pressed = keyboard_check_pressed(taunt)
	
	keyEscape = keyboard_check_pressed(vk_escape)
}