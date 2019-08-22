/// @description Initialize variables

// Created each time the player leaves a room //

// Color will start fully transparent, and slowly decrease
fade_out_color_ = c_black;
fade_out_alpha_ = 0;

// Level complete text timer
room_transition_timer_ = 30; // Display level complete for 30 frames, before fading out
next_room_			   = o_player.room_;

// Update the room and start position to the map
//ds_map_replace(o_game.save_data_, "Current Room", o_player.room_);
//ds_map_replace(o_game.save_data_, "Start Position", o_player.start_position_);
