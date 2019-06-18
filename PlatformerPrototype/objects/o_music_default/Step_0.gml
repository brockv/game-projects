/// @description Step logic

if (!instance_exists(o_player)) exit;

// Adjust the emitter's volume based on proximity to the player
var _gain = 1 - point_distance(x, y, o_player.x, o_player.y) / 350;
audio_sound_gain(default_music, _gain, 0);
