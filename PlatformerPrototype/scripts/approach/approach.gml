///@description approach( start, end, shiftAmount);
///@param start,end,shift
var _start = argument[0];
var _end = argument[1];
var _shift = argument[2];

if (_start < _end) {
	return (min(_start + _shift, _end));
} else {
	return (max(_start - _shift, _end));
}
