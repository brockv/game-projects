/// @description in_bounds(x, y, x1, y1, x2, y2)
/// @arg x
/// @arg y
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

// Return the position of the cursor click
return ((argument[0] >= argument[2]) && (argument[1] >= argument[3]) && (argument[0] <= argument[4]) && (argument[1] <= argument[5]))
