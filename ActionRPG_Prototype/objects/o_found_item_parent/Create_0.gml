/// @description Initialize Variables

// Holds the specific item that was found
item_found_ = noone;

// Adjust depth
depth = -o_player.y;

// Set the alarm
alarm[0] = global.one_second * 0.5;

// Play a sound effect
audio_play_sound(a_found_item, 2, false);