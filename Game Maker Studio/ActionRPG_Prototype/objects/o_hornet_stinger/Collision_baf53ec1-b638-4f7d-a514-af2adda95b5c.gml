/// @description Collision Logic

// Variables to make the argument more readable
var _angle = 0;
var _frames = 3;
var _target_array = [o_player];
var _damage = 1;
var _knockback = 1;
	
// Script call to create the hitbox
var _hitbox = create_hitbox(s_porcupine_hitbox, x, y, _angle, _frames, _target_array, _damage, _knockback);
	
// Play a sound effect
audio_play_sound(a_porcupine_attack, 7, false);

// Destroy the stinger
instance_destroy();
