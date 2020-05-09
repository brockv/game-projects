/// @description Initialize Variables

// 
image_alpha = 0;
target_image_alpha_ = 1;
next_room_ = o_player.room_;

// Update the room and start position to the map
ds_map_replace(o_game.save_data_, "Current Room", o_player.room_);
ds_map_replace(o_game.save_data_, "Start Position", o_player.start_position_);
