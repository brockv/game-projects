/// GetPlayerInput();

// Check for gamepad and assign it controls
/*if (gamepad_is_connected(0)) {

    kLeft          = keyboard_check(vk_left)               || gamepad_axis_value(0, gp_axislh) < -0.40;
    kRight         = keyboard_check(vk_left)               || gamepad_axis_value(0, gp_axislh) >  0.40;
    kUp            = keyboard_check(vk_left)               || gamepad_axis_value(0, gp_axislv) < -0.40;
    kDown          = keyboard_check(vk_left)               || gamepad_axis_value(0, gp_axislv) >  0.40; // Test new values
    
    kJump          = keyboard_check_pressed(vk_space)      || gamepad_button_check_pressed(0, gp_face1);
    kJumpRelease   = keyboard_check_released(vk_space)     || gamepad_button_check_released(0, gp_face1);
    
    
    kAction1       = keyboard_check(ord('Q'))              || gamepad_button_check(0, gp_shoulderrb);
    kAction2       = keyboard_check_pressed(ord('W'))      || gamepad_button_check_pressed(0, gp_shoulderlb);
    kAction3       = keyboard_check_pressed(ord('E'))      || gamepad_button_check_pressed(0, gp_shoulderl);
    kAction4       = keyboard_check_pressed(ord('R'))      || gamepad_button_check_pressed(0, gp_shoulderr);
    
    kAccept        = keyboard_check_pressed(vk_enter)      || gamepad_button_check_pressed(0, gp_face1);
    kAcceptRelease = keyboard_check_released(vk_enter)     || gamepad_button_check_released(0, gp_face1);
    kCancel        = keyboard_check_pressed(vk_backspace)  || gamepad_button_check_pressed(0, gp_face2);
    kPause         = keyboard_check_pressed(vk_escape)     || gamepad_button_check_pressed(0, gp_start);

// No gamepad, so assign controls to keyboard / mouse
} else {*/
    
    kLeft          = keyboard_check(vk_left);
    kRight         = keyboard_check(vk_right); 
    kUp            = keyboard_check(vk_up);
    kDown          = keyboard_check(vk_down);
    
    kJump          = keyboard_check_pressed(vk_space);
    kJumpRelease   = keyboard_check_released(vk_space);
    
    kAction1       = keyboard_check(ord('Q'));
    kAction2       = keyboard_check_pressed(ord('W'));
    kAction3       = keyboard_check_pressed(ord('E'));
    kAction4       = keyboard_check_pressed(ord('R'));
    
    
    kAccept        = keyboard_check_pressed(vk_enter);
    kAcceptRelease = keyboard_check_released(vk_enter);
    kCancel        = keyboard_check_pressed(vk_backspace);
    kPause         = keyboard_check_pressed(vk_escape);

//}


