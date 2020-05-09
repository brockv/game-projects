/// @description mouse_over()
/*
 * Checks if the mouse cursor is within an object's
 * bounding box.
 *
 * Returns true if cursor is within object's bounding box.
 *
 */
 
return ((mouse_x >= bbox_left) &&
        (mouse_x <= bbox_right) &&
        (mouse_y >= bbox_top) &&
        (mouse_y <= bbox_bottom));
