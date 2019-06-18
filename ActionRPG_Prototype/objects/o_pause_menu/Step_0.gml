/// @description Control the Menu

if (alarm[0] <= 0) {
   
   if (o_input.down_) 
   {
      if (menu_index_ < array_length_1d(option_) - 1) 
	  {
         menu_index_++;
      } 
	  else 
	  {
         menu_index_ = 0;
      }
      audio_play_sound(a_menu_move, 0, false);
      alarm[0] = room_speed / 6; 
   }
   
   if (o_input.up_) 
   {
      if (menu_index_ > 0) 
	  {
         menu_index_--;
      } 
	  else 
	  {
         menu_index_ = array_length_1d(option_) - 1;
   
      }
      audio_play_sound(a_menu_move, 0, false);
      alarm[0] = room_speed / 6;
   }
   
   // Execute the appropriate user event based on the menu selection
   if (o_input.action_one_pressed_ || o_input.action_two_pressed_) 
   {
	   event_user(menu_index_);
   }
  
}
