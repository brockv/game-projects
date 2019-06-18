/// @description Set the new resolution

var _resolution = o_control.resolution_selected_;
with(o_resolution) {
    if (!window_get_fullscreen() && _resolution != global.resolution_id_) {
        if (resolution_list_[_resolution, 0] > display_width_ || resolution_list_[_resolution, 1] > display_height_) {
			audio_play_sound(a_unpause, 5, 0);
		} else {
            audio_play_sound(a_menu_select, 5, 0);
            resolution_set(_resolution);
			global.resolution_id_ = _resolution;
			ini_save(o_resolution.file_name_);
        }
    }
}
