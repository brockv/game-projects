///@arg instance_id

// Assign argument[0] to a variable for clarity
var _id = argument[0];

// Check the array of destroyed objects for this instance_id
return array_find_index(generate_instance_key(_id), global.destroyed) != -1;