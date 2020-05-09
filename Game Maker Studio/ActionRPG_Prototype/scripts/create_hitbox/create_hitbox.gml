///@arg sprite
///@arg x
///@arg y
///@arg angle
///@arg frames
///@arg target_array
///@arg damage
///@arg knockback

var _sprite = argument[0];
var _x = argument[1];
var _y = argument[2];
var _angle = argument[3];
var _frames = argument[4];
var _target_array = argument[5];
var _damage = argument[6];
var _knockback = argument[7];

// Create an instance of the hitbox
var _hitbox = instance_create_layer(_x, _y, "Instances", o_hitbox);

// Assign the desired properties to the hitbox
_hitbox.sprite_index = _sprite;
_hitbox.image_angle = _angle;
_hitbox.alarm[0] = _frames;
_hitbox.targets_ = _target_array;
_hitbox.damage_ = _damage;
_hitbox.knockback_ = _knockback;

// Return the hitbox for outside use
return _hitbox;