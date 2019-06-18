/// @description Change selected resolution

if (!window_get_fullscreen()) {
    if (o_control.resolution_selected_ < array_height_2d(o_resolution.resolution_list_) - 1) {
        o_control.resolution_selected_++;
        audio_play_sound(a_menu_move, 5, 0);
    }
}

