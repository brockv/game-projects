///@arg value
///@arg target_array

var _value = argument[0];
var _target_array = argument[1];
var _array_length = array_length_1d(_target_array);

// Loop through the array and see if the value is in the target list
var _index = 0;
repeat (_array_length)
{
	if (_value == _target_array[_index]) return true;
	if (object_is_ancestor(_value, _target_array[_index])) return true;
	_index++;
}