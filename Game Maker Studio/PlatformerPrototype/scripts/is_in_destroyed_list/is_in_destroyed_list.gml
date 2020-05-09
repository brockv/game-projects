/// @description is_in_destroyed_list()
/// @arg instance_id

var _id = argument[0];
return array_find_index(_id, destroyed) != -1;