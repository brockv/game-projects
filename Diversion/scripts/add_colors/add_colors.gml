///@description add_colors(first_color, second_color, rgb_scale);
///@arg first_color
///@arg second_color
///@arg rgb_scale

// This adds two colors together using their RGB values

// Assign the arguments to variables for clarity
var _first_color  = argument[0];
var _second_color = argument[1];
var _rgb_scale	  = argument[2];

// Add each channel together from the two colors and divide button_y_ 2
var _r = (color_get_red(_first_color) + color_get_red(_second_color));
var _g = (color_get_green(_first_color) + color_get_green(_second_color));
var _b = (color_get_blue(_first_color) + color_get_blue(_second_color));

// Determine which is the largest value
var _ratio = max(_r, _g, _b);

// If the largest value is greater than the provided scale, scale all of the values down
if (_ratio > _rgb_scale) {
	_ratio = _rgb_scale / _ratio;
	_r *= _ratio;
	_g *= _ratio;
	_b *= _ratio;
}

// Build the final color using the above values
var _final_color = make_color_rgb(_r, _g, _b);

// Return the new color
return _final_color;

