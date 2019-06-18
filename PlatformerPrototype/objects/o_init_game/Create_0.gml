/// @description Initialize game variables and set/create global variables on game start
// This is a persistent object, and will never be destroyed during the game.

// Set the size of the GUI to the size of the camera of the game so that everything draws correctly
globalvar view_width,view_heigth;
view_width	= camera_get_view_width(view_camera[0]);
view_heigth = camera_get_view_height(view_camera[0]);

// Set GUI to the correct size
display_set_gui_size(view_width,view_heigth);

// Create and set a custom font
draw_set_font(fnt_game_text);

// Game variables
globalvar pause, player_death, last_level, room_selected;

pause		 = 0;	// Start on false -- (not paused)
player_death = 0;	// Set player death state to false
last_level	 = -4;	// Used to save the last level player has visited. (-4 == noone)

// Menu variables
globalvar menu_active;
menu_active		= 1;	// Set to true -- display main menu

#region // Controller input globals
globalvar k_up, k_left, k_down, k_right, k_enter, k_dash, k_jump_pressed, k_jump_released, k_charge_pressed, k_charge_released;
globalvar k_back,k_pause,player_left_check,player_right_check,player_up_check,player_down_check;

// Menu movement
k_up	= 0;
k_left	= 0;
k_down	= 0;
k_right	= 0;
k_enter	= 0;
k_back	= 0;
k_pause	= 0;

// Player movement
player_left_check	= 0;
player_right_check	= 0;
player_up_check		= 0;
player_down_check	= 0;
k_dash				= 0;
k_jump_pressed		= 0;
k_jump_released		= 0;
k_charge_pressed	= 0;
k_charge_released	= 0;
#endregion

#region // Camera and screenshake
globalvar screenshake, screenshake_on, screenshake_amount_x, screenshake_amount_y, screenshake_timer, screenshake_max_timer;
screenshake				= 0;  // Is screenshake currently active
screenshake_on			= 1;  // Is screenshake enabled
screenshake_amount_x	= 0;  // Screenshake x-axis shake amount
screenshake_amount_y	= 0;  // Screenshake y-axis shake amount
screenshake_max_timer	= 15; // How many frames the screenshake will run
screenshake_timer		= screenshake_max_timer; 
#endregion

#region // Sound variables
globalvar sound_effects_gain, sound_music_gain, emitter_sound_effects, emitter_sound_music;

// Emitters
emitter_sound_music		= audio_emitter_create(); // Create an audio emmitter -- all sounds effects will be played using this sound emitter (Changing the sound emitter gain(volume) will change the gain(volume) for all music using this emitter)
emitter_sound_effects	= audio_emitter_create(); // Same as above

// Gain and volume
sound_music_gain	= 0.5;	// Starts on 50 percent
sound_effects_gain	= 0.5;	// Starts on 50 percent

// Set emitters to play at correct volume.
audio_emitter_gain(emitter_sound_music,sound_music_gain);
audio_emitter_gain(emitter_sound_effects,sound_effects_gain);

#endregion

// FPS timer
fps_timer = 30; // every 30 frames update fps
fps_amout = 0;