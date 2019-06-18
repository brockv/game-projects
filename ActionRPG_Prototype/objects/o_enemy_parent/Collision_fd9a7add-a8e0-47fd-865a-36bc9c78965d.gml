/// @description Hit Logic

// Check if the enemy health is already 0 or less, and exit if so
if (health_ <= 0) exit;

// Only run if the hitbox can damage this enemy
if (hurtbox_entity_can_be_hit_by(other)) {
	// Give invincibilty frames
	invincible_ = true;
	alarm[0] = global.one_second * 0.25;
	
	// Create a hit effect
	var _sprite = s_hit_effect;
	var _image_speed = 1;
	var _has_depth = true;
	create_animation_effect(_sprite, x, y - 8, _image_speed, _has_depth);
	
	// Decrement enemy health
	health_ -= other.damage_;

	// Change states to Hit State
	state_ = enemy.hit;

	// Set movement to reflect being hit
	var _knockback_direction = point_direction(other.x, other.y, x, y);
	set_movement(_knockback_direction, other.knockback_);
	
	// Play a sound effect
	audio_play_sound(a_hit, 7, false);
	
	// Shake the screen
	with (o_camera) {
		alarm[0] = 2;
		screen_shake_ = true;
	}
}