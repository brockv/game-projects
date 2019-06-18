/// @description Sword State

// Update image speed
image_speed = 1;

// Create the hitbox for the sword starting at frame 1
if (animation_hit_frame(1))
{
	// Variables to make the argument more readable
	var _angle = direction_facing_ * 90;
	var _frames = 3;
	var _target_array = [o_enemy_parent, o_destroyable_object_parent];
	var _damage = 1
	var _knockback = 3;
	
	// Script call to create the hitbox
	var _hitbox = create_hitbox(s_sword_hitbox, x, y, _angle, _frames, _target_array, _damage, _knockback);

	// Play a sound effect
	audio_play_sound(a_swipe, 8, false);
	
	// Adjust the hitbox based on the direction the player is facing
	switch (direction_facing_)
	{
		case dir.up:
			_hitbox.y -= 4;
			break;
		
		default:
			_hitbox.y -= 8;
			break;
	}
}

var _combo_input = o_input.action_sword_;

// Perform a combo attack or exit the sword state at the end of the animation
if (animation_hit_frame(image_number - 1))
{
	//if (_combo_input)
	//{
	//	state_ = player.sword_hold;
	//}
	//else
	//{
		state_ = player.move;
	//}
}


