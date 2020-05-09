///@description approach(current, target, amount)
///@arg current
///@arg target
///@arg amount

var _current = argument[0];
var _target = argument[1];
var _amount = argument[2];

if (_current < _target) {
    return min(_current + _amount, _target); 
} else {
    return max(_current - _amount, _target);
}