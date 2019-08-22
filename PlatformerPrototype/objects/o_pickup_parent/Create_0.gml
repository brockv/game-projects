/// @description Initialize variables

if (is_in_destroyed_list(id)) {
	instance_destroy();
}

PICKED_UP_ = 0;

// Create a lifespan timer
//life_span_ = global.one_second * 10;
//alarm[0] = life_span_;

// Set z components
anchor_y_ = ystart;
frequency_ = 0.05;
amplitude_ = 2;
timer_ = 0;

// Pick-up flag
can_pickup_ = true;

// Play a sound effect
//audio_play_sound_on(emitter_sound_effects, a_item, 2, false);
