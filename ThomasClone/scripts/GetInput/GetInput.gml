/// @description  GetInput();

// Movement.

// Input //////////////////////////////////////////////////////////////////////

//var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kNextChar, kPrevChar, kAccept, kCancel;

kLeft        = keyboard_check(vk_left); //              || gamepad_axis_value(0, gp_axislh) < -0.40;
kRight       = keyboard_check(vk_right); //             || gamepad_axis_value(0, gp_axislh) >  0.40;
kUp          = keyboard_check(vk_up); //                || gamepad_axis_value(0, gp_axislv) < -0.40;
kDown        = keyboard_check(vk_down); //              || gamepad_axis_value(0, gp_axislv) >  0.75; // Test new values

kJump        = keyboard_check_pressed(vk_space); //     || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(vk_space); //    || gamepad_button_check_released(0, gp_face1);

kNextChar    = keyboard_check_pressed(ord("E")); //     || gamepad_button_check_pressed(0, gp_shoulderr);
kPrevChar    = keyboard_check_pressed(ord("Q")); //     || gamepad_button_check_pressed(0, gp_shoulderl);

kAccept      = keyboard_check_pressed(vk_enter); //     || gamepad_button_check_pressed(0, gp_face1);
kCancel      = keyboard_check_pressed(vk_backspace); // || gamepad_button_check_pressed(0, gp_face2);
kPause       = keyboard_check_pressed(vk_escape); //    || gamepad_button_check_pressed(0, gp_start);

// Check for gamepad and give it priority
if (gamepad_is_connected(0)) {

    kLeft        = gamepad_axis_value(0, gp_axislh) < -0.40;
    kRight       = gamepad_axis_value(0, gp_axislh) >  0.40;
    kUp          = gamepad_axis_value(0, gp_axislv) < -0.40;
    kDown        = gamepad_axis_value(0, gp_axislv) >  0.75; // Test new values
    
    kJump        = gamepad_button_check_pressed(0, gp_face1);
    kJumpRelease = gamepad_button_check_released(0, gp_face1);
    
    kNextChar    = gamepad_button_check_pressed(0, gp_shoulderr);
    kPrevChar    = gamepad_button_check_pressed(0, gp_shoulderl);
    
    kAccept      = gamepad_button_check_pressed(0, gp_face1);
    kCancel      = gamepad_button_check_pressed(0, gp_face2);
    kPause       = gamepad_button_check_pressed(0, gp_start);

}


// Switch to the next shape
if (kNextChar) {
    // Check for charges
    if (switchCharges >= 1) {
    
        // Morph effect
        xscale = 0.5;
        yscale = 1.5;
        changingShapes = true;
        state = ChangingShapes;
        audio_play_sound(snd_CycleShapes, 0, false);
        SwitchNextShape();
        
    // No charges - play error sound
    } else {
        audio_play_sound(snd_Error, 0, false);
    }
}
// Switch to the previous shape
if (kPrevChar) {
    // Check for charges
    if (switchCharges >= 1) {
    
        // Morph effect
        xscale = 0.5;
        yscale = 1.5;
        changingShapes = true;
        state = ChangingShapes;
        audio_play_sound(snd_CycleShapes, 0, false);
        SwitchPrevShape();
        
    // No charges - play error sound
    } else {
        audio_play_sound(snd_Error, 0, false);
    }
}
