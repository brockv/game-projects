/// @description Lights alarm

// Creates a fast light at a random x-position just past the bottom of the room
instance_create_layer(random(room_width), room_height + 10, "Init_game", o_aura_fast_menu_light);

// Reset this alarm
alarm[1] = 60;
