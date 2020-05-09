/// @description Run begin event

// Run script to check for player input
check_controller_input();

// Update emitters to play at correct volume.
audio_emitter_gain(emitter_sound_music, sound_music_gain);
audio_emitter_gain(emitter_sound_effects, sound_effects_gain);