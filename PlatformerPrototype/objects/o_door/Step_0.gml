/// @description Collision and effect

// Inherit from o_visible_parent
event_inherited();

// Collide with player, create fade out, then go to the next screen

// Rotate square sprite
door_rotation_ += 2;
if (door_rotation_ <= -360) door_rotation_ = 0;

// Go to the next room
if (place_meeting(x, y, o_player) && !level_complete_sound_) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects,a_level_complete,false,7);
	
	// Set the level complete flag to true
	level_complete_sound_ = 1;
	
	// Create fade out effect
	if !instance_exists(o_fade_out) instance_create_layer(x, y, "menu", o_fade_out);
}
