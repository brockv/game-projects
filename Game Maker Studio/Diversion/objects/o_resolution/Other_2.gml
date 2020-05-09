/// @description Game start logic

// Load the audio groups
audio_group_load(ag_music);
audio_group_load(ag_sound_effects);

// Set a custom mouse cursor
cursor_sprite = s_mouse_cursor;
window_set_cursor(cr_none);
