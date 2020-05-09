/// @description Hitbox Logic

// Logic
if (hurtbox_entity_can_be_hit_by(other))
{
	// Add invincibility frames and decrement health
	invincible_ = true;
	alarm[0] = global.one_second * 0.4;
	player_health_ -= other.damage_;
	//ds_map_replace(o_game.save_data_, "Health", player_health_);
	
	// Apply knockback in the appropriate direction
	var _direction = point_direction(other.x, other.y, x, y)
	set_movement(_direction, other.knockback_);
	
	// Play a sound effect
	audio_play_sound(a_hurt, 6, false);
	
	// Enter the hit state and execute it immediately
	state_ = player.hit;
	event_user(state_);
	
	// Shake the screen when the player gets hit
	with (o_camera)
	{
		alarm[0] = 2;
		screen_shake_ = true;
	}
}
