/// @description Initialize variables

light_   = make_color_rgb(124, 124, 124);
default_ = make_color_rgb(52, 51, 75);
dark_    = make_color_rgb(48, 48, 48);

// Change the color of the block based on the background color
switch (global.background_color_) {
	case light_:   image_blend = make_color_rgb(40, 40, 40); break;
	case default_: image_blend = make_color_rgb(53, 52, 75); break;
	case dark_:    image_blend = make_color_rgb(76, 76, 76); break;
}