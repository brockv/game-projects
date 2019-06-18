/// @description Activate / Deactivate

// Toggle the audio
if (!muted_) {
	muted_ = true;
	previous_volume_ = global.music_volume_;
	global.music_volume_ = 0;
	image_index = 1;
} else {
	muted_ = false;
	global.music_volume_ = previous_volume_;
	image_index = 0;
}
	
