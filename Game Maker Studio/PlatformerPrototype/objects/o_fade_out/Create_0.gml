/// @description Initialize variables

// Created each time the player leaves a room //

// Color will start fully transparent, and slowly decrease
fade_out_color_ = c_black;
fade_out_alpha_ = 0;

// Level complete text timer
room_transition_timer_ = 30; // Display level complete for 30 frames, before fading out