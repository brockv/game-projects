/// @description Draw the Menu

// Set draw variables
var _xx = display_get_gui_width() / 2;
var _yy = display_get_gui_height() / 2;

var _array_size = array_length_1d(option_);
draw_set_halign(fa_center);

// Font direction /////////////////////////////////////////////////////////////

font_ang_ += font_dir_ * 0.25;

if (font_ang_ > 4) font_dir_ = -1;
if (font_ang_ < -4) font_dir_ = 1;

///////////////////////////////////////////////////////////////////////////////

draw_text(_xx, _yy - 80, title_);
draw_text(_xx, _yy + 80, my_message_);


// Draw the menu options
for (var _i = 0; _i <= _array_size - 1; _i++) {
    draw_set_colour(c_gray);
    if (_i == menu_index_) {
       draw_set_colour(c_white);
    }
    draw_text_transformed(_xx, (_yy - 20) + (_i * 16), string(option_[_i]), 1, 1, font_ang_);
}


// Reset color and alignment
draw_set_colour(c_white);
draw_set_halign(fa_left);
