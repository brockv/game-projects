/// @description Collision and effect

// Inherit from o_visible_parent
event_inherited();

// Collide with player, create fade out, then go to the next screen

// Rotate square sprite
door_rotation += 2;
if (door_rotation <= -360) door_rotation = 0;

// Go to the next room
if (place_meeting(x, y, o_player) && !level_complete_sound) {
	// Play a sound effect
	audio_play_sound_on(emitter_sound_effects,a_level_complete,false,7);
	
	// Set the level complete flag to true
	level_complete_sound = 1;
	
	// Create fade out effect
	if !instance_exists(o_fade_out) instance_create_layer(x, y, "menu", o_fade_out); // Create fade out object
}
