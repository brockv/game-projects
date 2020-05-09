/// @description Audio group checks

if (audio_group_is_loaded(ag_music) && !audio_is_playing(a_title_music)) {
	// Fade the music in
	audio_play_sound(a_title_music, 1000, true);
	audio_sound_gain(a_title_music, 0, 0);
	audio_sound_gain(a_title_music, global.music_volume_, 2000);
	
	// Proceed to the next room (r_main_menu)
	room_goto_next();
}

