/// @description mid_x()
/*
 * Gets the midpoint of an object's bounding box.
 * 
 * Argument is optional. If no argument is given, it
 * will use the calling object's id.
 *
 * Returns the midpoint of the object's bouncing box.
 *
 */

// Get the id of the calling object
var _i = id;

// If an argument was provided, override the default value
if (argument_count > 0) {
    _i = argument[0];
}

// Return the result
return (_i.bbox_left + _i.bbox_right) / 2;
