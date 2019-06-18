///@description Menu control logic

// Setup the menu controls
_key_left    = mouse_wheel_down();
_key_right   = mouse_wheel_up();
_key_confirm = mouse_check_button_pressed(mb_left);




// Starts rotation
if (rotating_ != 0) {
	direction += sign(rotating_) * 4;
	rotating_ -= sign(rotating_) * 4;
}