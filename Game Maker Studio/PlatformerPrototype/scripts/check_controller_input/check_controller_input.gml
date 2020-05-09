// Run this in the begin step event to check for any key input from player

// Menu movement key check
k_up	= keyboard_check_released(vk_up)	 || gamepad_axis_value(0, gp_axislv) < -0.40;
k_left	= keyboard_check_released(vk_left)   || gamepad_axis_value(0, gp_axislh) < -0.40;
k_down	= keyboard_check_released(vk_down)   || gamepad_axis_value(0, gp_axislv) >  0.40;
k_right	= keyboard_check_released(vk_right)  || gamepad_axis_value(0, gp_axislh) >  0.40;
k_enter	= keyboard_check_released(vk_enter)  || gamepad_button_check_pressed(0, gp_face1);
k_back	= keyboard_check_released(vk_escape) || gamepad_button_check_pressed(0, gp_face2);
k_pause	= keyboard_check_released(vk_escape) || gamepad_button_check_pressed(0, gp_start);

// Player movement key check
player_left_check  = keyboard_check(vk_left)		   || gamepad_axis_value(0, gp_axislh) < -0.40;
player_right_check = keyboard_check(vk_right)		   || gamepad_axis_value(0, gp_axislh) >  0.40;
player_up_check	   = keyboard_check(vk_up)			   || gamepad_axis_value(0, gp_axislv) < -0.40;
player_down_check  = keyboard_check(vk_down)		   || gamepad_axis_value(0, gp_axislv) >  0.40;
k_jump_pressed	   = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
k_jump_released	   = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
k_dash			   = keyboard_check_pressed(ord("D"))  || gamepad_button_check_pressed(0, gp_shoulderrb);
k_charge_pressed   = keyboard_check(ord("S"))		   || gamepad_button_check(0, gp_shoulderlb);
k_charge_released  = keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_shoulderlb);

// Player action key check
k_action_1 = keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0, gp_face3);
k_action_2 = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0, gp_face2);
k_action_3 = keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(0, gp_face4);

// Restart game.
if (keyboard_check_released(ord("R"))) {
	game_restart();	
}
