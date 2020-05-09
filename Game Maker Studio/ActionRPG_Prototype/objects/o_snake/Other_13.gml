/// @description Attack State

// Update the image speed
image_speed = 0.75;

// Create the hitbox on the appropriate frame
var _target_frame = 3;
if (animation_hit_frame(_target_frame)) {
	// Variables to make the argument more readable
	var _angle = 0;
	var _frames = 1;
	var _target_array = [o_player];
	var _damage = 1;
	var _knockback = 4;
	
	// Script call to create the hitbox
	var _hitbox = create_hitbox(s_porcupine_hitbox, x + (6 * sign(image_xscale)), y - 8, _angle, _frames, _target_array, _damage, _knockback);
	
	// Play a sound effect
	audio_play_sound(a_porcupine_attack, 7, false);
}

// Exit the attack state at the end of the animation
if (animation_hit_frame(image_number - 1)) {
	state_ = snake.idle;
	alarm[1] = 2 * global.one_second;
	sprite_index = s_snake_run;
	image_index = 0;
}