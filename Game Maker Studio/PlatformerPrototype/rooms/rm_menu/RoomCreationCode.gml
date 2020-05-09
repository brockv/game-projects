// create fade in effect.
if !instance_exists(o_fade_in) instance_create_layer(x,y,"menu",o_fade_in);

// Play the title music
audio_stop_all();
audio_play_sound_on(emitter_sound_music, a_music_menu, true, 7);