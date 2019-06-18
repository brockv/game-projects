/// @description Death Logic

// Create a death effect
var _sprite = s_death_effect;
var _image_speed = 1;
var _has_depth = true;
create_animation_effect(_sprite, x, y - 8, _image_speed, _has_depth);

// Create the chance for item drops
if (chance(0.75)) {
	var _item = choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x, y - 8, "Instances", _item);
}
