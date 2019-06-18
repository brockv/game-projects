/// @description Destroy Logic

// Create an effect when destroyed
var _image_speed = random_range(0.4, 0.8);
create_animation_effect(sprite_, x, y, _image_speed, has_depth_);

// Create the chance for item drops
if (chance(0.1)) // 10% chance
{
	var _item = choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x + 8, y + 8, "Instances", _item);
}
