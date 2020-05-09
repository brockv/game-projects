/// @description Full screen toggle

if (can_switch_) {
    resolution_switch();
    audio_play_sound(a_menu_select, 5, 0);
    can_switch_ = 0;
    alarm[0] = 20;
}

