///@description subtract_color(current_color, color_to_remove);
///@arg list
///@arg rgb_scale

// This subtracts a given of colors from the original color

// Assign the arguments to variables for clarity
var _current_color  = argument[0];
var _color_to_remove = argument[1];

var _r1 = color_get_red(_current_color);
var _g1 = color_get_green(_current_color);
var _b1 = color_get_blue(_current_color);

var _r2 = color_get_red(_color_to_remove);
var _g2 = color_get_green(_color_to_remove);
var _b2 = color_get_blue(_color_to_remove);

// Subtract each channel from the original color
_r1 = max(_r1 - _r2, 0);
_g1 = max(_g1 - _g2, 0);
_b1 = max(_b1 - _b2, 0);


// Build the final color using the above values
var _final_color = make_color_rgb(_r1, _g1, _b1);

// Return the new color
return _final_color;

