/// @description Control the fade

// Adjust the alpha either towards 0 or 1, depending on the fade value
alpha_ = clamp(alpha_ + (fade_ * 0.015), 0, 1);

// Once the screen is black, move to the next room and toggle the fade value
if (alpha_ == 1) {
	if (room != r_demo_end) {
		room_goto_next();
	} else {
		room_goto(r_main_menu);
	}
	fade_ = -1;
}

// Once the screen has faded back in, destroy this object
if (alpha_ == 0 && fade_ == -1) {
	instance_destroy();
}
