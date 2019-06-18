/// @description line_of_sight(x1, y1, x2, y2, [precision])
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  [precision]
/*
 * Checks for solid blocks between (x1, y1) and (x2, y2)
 * x1, y1, x2, y2 - positions
 * 
 * Returns true if there are no blocks between the points,
 *         false otherwise.
 *
 * If you want a speed boost, increase the precision variable
 *
 */
 
// Assign arguments for clarity
var _x1, _y1, _x2, _y2, _xx, _yy, _dir, _dis, _i, _result, _precision;
_x1 = argument[0];
_y1 = argument[1];
_x2 = argument[2];
_y2 = argument[3];
_precision = 2;

// If a precision value was passed in, assign it as well
if (argument_count > 4) {
    _precision = argument[4];
}

// Get the direction and distance between the two points
_dir = point_direction(_x1, _y1, _x2, _y2);
_dis = point_distance(_x1, _y1, _x2, _y2);

// Initialize _result to true
_result = true;

// Set the mask index for checking for line of sight
var _mask = mask_index;
mask_index = s_pixel;

// Check for a collision with a solid object along a line between the two points
for (_i = _precision; _i < _dis; _i += _precision) {
    // Get the current x and y position along the line between the two points
	_xx = _x1 + lengthdir_x(_i, _dir);
    _yy = _y1 + lengthdir_y(_i, _dir);
	
	// If there's a solid block at any point between the two points, set result to false and break the loop
    if (place_meeting(_xx, _yy, o_collision_parent)) {
        _result = false;
        break;
    }
}

// Reset the mask index
mask_index = _mask;

// Return the result
return (_result);
