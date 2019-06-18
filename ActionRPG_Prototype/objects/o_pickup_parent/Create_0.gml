/// @description Initialize Variables

PICKED_UP_ = 0;

// Adjust depth
depth = -y;

// Create a lifespan timer
life_span_ = global.one_second * 10;
alarm[0] = life_span_;

// Set z components
z_ = 0;
z_speed_ = -4;

// Give gravity to apply
gravity_ = 0.25;

// Pick-up flag
can_pickup_ = false;

// Play a sound effect
audio_play_sound(a_item, 2, false);
