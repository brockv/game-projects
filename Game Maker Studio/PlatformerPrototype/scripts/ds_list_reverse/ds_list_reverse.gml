/// @description ds_list_reverse(list_from, list_to)
/// @param list_from
/// @param list_to
/*
 * Adds contents from list_from to list_to, but in reverse order.
 */
 
// Assign arguments to variables for clarity
var _list_from = argument[0];
var _list_to = argument[1];

// Loop through the list in reverse order, adding each value to our resulting list
for (var _i = ds_list_size(_list_from) - 1; _i >= 0; _i--) {
    ds_list_add(_list_to, _list_from[|_i]);
}



