/// @description Get Input

// Define movement controls
right_				 = keyboard_check(vk_right);
left_				 = keyboard_check(vk_left);
up_					 = keyboard_check(vk_up);
down_				 = keyboard_check(vk_down);

// Define menu controls
right_pressed_		 = keyboard_check_pressed(vk_right);
left_pressed_		 = keyboard_check_pressed(vk_left);
accept_pressed_		 = keyboard_check_pressed(vk_enter);

// Define action keys
action_sword_		 = keyboard_check_pressed(ord("1"));
action_one_pressed_  = keyboard_check_pressed(ord("2"));
action_two_pressed_  = keyboard_check_pressed(ord("3"));
action_one_held_     = noone;
action_one_released_ = keyboard_check_released(ord("2"));
action_two_held_	 = noone;
action_two_released_ = noone;
dash_				 = keyboard_check_pressed(ord("T"));

// Define pause key
pause_pressed_		 = keyboard_check_pressed(vk_escape);

// Check for gamepad and give it priority
if (gamepad_is_connected(0)) {

    // Define movement controls
	right_				 = gamepad_axis_value(0, gp_axislh) >  0.40;
    left_				 = gamepad_axis_value(0, gp_axislh) < -0.40;
    up_					 = gamepad_axis_value(0, gp_axislv) < -0.40;
    down_				 = gamepad_axis_value(0, gp_axislv) >  0.40; // Test new values
	
	// Define menu controls
	right_pressed_		 = gamepad_axis_value(0, gp_axislh) >  0.40;
    left_pressed_    	 = gamepad_axis_value(0, gp_axislh) < -0.40;
	accept_pressed_      = gamepad_button_check_pressed(0, gp_face1);
    cancel_pressed_      = gamepad_button_check_pressed(0, gp_face2);
    
	// Define action keys
	action_sword_		 = gamepad_button_check_pressed(0, gp_face3);
	action_one_pressed_  = gamepad_button_check_pressed(0, gp_shoulderlb);
    action_two_pressed_  = gamepad_button_check_pressed(0, gp_shoulderrb);
	action_one_held_	 = noone;
	action_one_released_ = gamepad_button_check_released(0, gp_shoulderlb);
	action_two_held_	 = noone;
	action_two_released_ = gamepad_button_check_released(0, gp_shoulderrb);
	dash_				 = gamepad_button_check_pressed(0, gp_face2);
    
	// Define pause key
	pause_pressed_       = gamepad_button_check_pressed(0, gp_start);

}



