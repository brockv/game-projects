/// @description array_find_index(value, array)
///@arg value
///@arg array

var _value = argument[0];
var _array = argument[1];

// Look for value in the target array - returns -1 if not found
var _array_size = array_length_1d(_array);
for (var _i = 0; _i < _array_size; _i++) {
	if (_array[_i] == _value) {
		return _i;
	}
}

return -1;