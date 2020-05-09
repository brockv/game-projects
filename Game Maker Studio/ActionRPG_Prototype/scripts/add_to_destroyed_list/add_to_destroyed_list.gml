///@arg instance_id

// Assign argument[0] to a variable for clarity
var _id = argument[0];

// Add this object to the array of destroyed objects
global.destroyed[array_length_1d(global.destroyed)] = generate_instance_key(_id);