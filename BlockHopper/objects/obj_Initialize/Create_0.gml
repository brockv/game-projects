/// @description Initialize Game Variables

global.pause = 0;
global.attempt_number = 1;
global.count_up = true;
global.switch_gravity = true;
global.game_start = false;
global.player_color = 0;
global.stages_complete = 0;
global.difficulty_path = "";
global.current_color = 0;
global.player_dead = false;
global.falling = false;

//Checkpoint Variables
global.checkpoint = noone;
global.checkpointR = 0;
global.checkpointx = 0;
global.checkpointy = 0;

window_set_cursor(cr_none);

Set_Display();

//global.playing= true;
//global.video_playing = 0;

audio_stop_all();
audio_play_sound(music_Title, 80, true);
audio_sound_gain(music_Title, 0.6, 0);

room_goto(room_Start_Menu);


