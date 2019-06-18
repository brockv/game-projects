/// @description Evade State

// Update image speed
image_speed = 0.7;

// Add invincibility frames
invincible_ = true;
alarm[3] = global.one_second * 0.25;

// Update player speed
set_movement(evade_direction_, evade_speed_);
move_movement_entity(false);

// Play a sound effect at the beginning of the animation
if (animation_hit_frame(1))
{
	// Play the sound effect
	audio_play_sound(a_evade, 5, false);
}

// Exit the evade state at the end of the animation
if (animation_hit_frame(image_number - 1))
{
	state_ = player.move;
}
