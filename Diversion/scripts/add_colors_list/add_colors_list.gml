///@description add_colors_list(list, rgb_scale);
///@arg list
///@arg rgb_scale

// This adds a list of colors together using their RGB values

// Assign the arguments to variables for clarity
var _list  = argument[0];
var _rgb_scale = argument[1];

var _r = 0, _g = 0, _b = 0;
// Add each channel together from each of the colors in the list
for (var _i = 0; _i < ds_list_size(_list); _i ++) {
	_r += color_get_red(_list[| _i]);
	_g += color_get_green(_list[| _i]);
	_b += color_get_blue(_list[| _i]);
}

// If any of the values are greater than 255, take 255 instead
_r = min(_r, 255);
_g = min(_g, 255);
_b = min(_b, 255);

// Determine which is the largest value
//var _ratio = max(_r, _g, _b);

// If the largest value is greater than the provided scale, scale all of the values down
//if (_ratio > _rgb_scale) {
//	_ratio = _rgb_scale / _ratio;
//	_r *= _ratio;
//	_g *= _ratio;
//	_b *= _ratio;
//}

// Build the final color using the above values
var _final_color = make_color_rgb(_r, _g, _b);

// Return the new color
return _final_color;

