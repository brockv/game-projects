/// @description Hitbox Logic

// Destroy if hit by specific hitboxes
if (hurtbox_entity_can_be_hit_by(other))
{
	instance_destroy();
	
	//// Create an effect when destroyed
	//var _image_speed = random_range(0.4, 0.8);
	//create_animation_effect(sprite_, x, y, _image_speed, has_depth_);
}
