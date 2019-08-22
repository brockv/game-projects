///@arg sprite
///@arg x
///@arg y
///@arg image_speed
///@arg has_depth

var _sprite = argument[0];
var _x = argument[1];
var _y = argument[2];
var _image_speed = argument[3];
var _has_depth = argument[4];

// Create the effect using the arguments
var _effect = instance_create_layer(_x, _y, "player", o_animation_effect);
_effect.sprite_index = _sprite;
_effect.image_speed = _image_speed;

// Add depth if the effect should have it
if (_has_depth)
{
	_effect.depth = -_y;
}

// Return the effect
return _effect;