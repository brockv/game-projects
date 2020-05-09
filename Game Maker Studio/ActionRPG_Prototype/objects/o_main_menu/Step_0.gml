/// @description Control the Menu

if (alarm[0] <= 0) {
   
   if (o_input.down_) {
      if (menu_index_ < array_length_1d(option_) - 1) {
         menu_index_++;
      } else {
         menu_index_ = 0;
      }
      audio_play_sound(a_menu_move, 0, false);
      alarm[0] = room_speed / 6; 
   }
   
   if (o_input.up_) {
      if (menu_index_ > 0) {
         menu_index_--;
      } else {
         menu_index_ = array_length_1d(option_) - 1;   
      }
      audio_play_sound(a_menu_move, 0, false);
      alarm[0] = room_speed / 6;
   }
   
   // Execute the appropriate user event based on the menu selection
   if (o_input.accept_pressed_) {
	   if (o_game.file_name_ == noone) {
		   switch (menu_index_) {
			   case 0: event_user(NEW_GAME_) break;
			   case 1: event_user(OPTIONS_) break;
			   case 2: event_user(EXIT_GAME_) break;
		   }
	   } else {
		   switch (menu_index_) {
			   case 0: event_user(NEW_GAME_) break;
			   case 1: event_user(LOAD_GAME_) break;
			   case 2: event_user(OPTIONS_) break;
			   case 3: event_user(EXIT_GAME_) break;
		   }
	   }
   }
}
