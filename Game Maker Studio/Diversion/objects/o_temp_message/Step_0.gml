/// @description Step logic

if (mouse_check_button_pressed(mb_left)) {
	instance_create_depth(x, y, 0, o_fade_transition);
}
