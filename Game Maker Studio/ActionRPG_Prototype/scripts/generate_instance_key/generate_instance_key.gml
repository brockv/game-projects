///@arg instance_id

// Assign argument[0] to a variable for clarity
var _id = argument[0];

// Initialize the variables use to generate the key
var _room = room_get_name(room);
var _name = object_get_name(_id.object_index);
var _x = string(_id.xstart);
var _y = string(_id.ystart);

// Build the key using the above variables
var _key = _room + _name + _x + _y;

// Return the key
return _key;