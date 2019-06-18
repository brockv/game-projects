/// @description Initialize variables

// Enable / disable flag
can_click_ = true;

// Set limits for both ends of the bar
right_limit_ = x + (sprite_get_width(s_slider_bar) / 2) - 32;
left_limit_ = x - (sprite_get_width(s_slider_bar) / 2) + 32;

// Create the slider for this bar and initialize values for it
slider_ = instance_create_depth(x, y, -10, o_audio_slider);
slider_.depth = -10;
slider_.image_xscale = 1;
slider_.image_yscale = 1;
slider_.bar_length_ = sprite_get_width(s_slider_handle);
slider_.right_limit_ = right_limit_;
slider_.left_limit_ = left_limit_;
slider_.percentage_ = global.music_volume_ * 100;

// Set the current x value using the above percentage value
slider_.x = slider_.left_limit_ + ((slider_.percentage_ / 100) * (slider_.right_limit_ - slider_.left_limit_));

// Initialize clicked flag to false
slider_.clicked_ = false;