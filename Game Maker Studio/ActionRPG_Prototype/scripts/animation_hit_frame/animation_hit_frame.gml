///@arg frame

// Checks to see if the target frame is within an acceptable range

var _frame = argument[0];
var _speed = global.one_second / sprite_get_speed(sprite_index);

return (image_index >= _frame + 1 - image_speed / _speed) && (image_index < _frame + 1);
