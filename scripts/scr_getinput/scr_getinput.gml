function scr_getinput()
{
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