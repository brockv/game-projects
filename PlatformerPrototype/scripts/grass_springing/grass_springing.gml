///@desc grass_springing()
///@param current_pos, target_pos, speed, friction

var _current_pos = argument[0];
var _target_pos = argument[1];
var _speed = argument[2];
var _friction = argument[3];

velocity_ *= _friction;
velocity_ += (_target_pos - _current_pos) / _speed;
_current_pos += velocity_;

return (_current_pos);
