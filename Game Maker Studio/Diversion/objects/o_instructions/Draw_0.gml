/// @description Draw the instructions

draw_set_font(f_large);
draw_text(gui_width_ / 2, 60, "Instructions");
draw_text(gui_width_ / 2, 110, "----------------");

// Draw the general instructions
draw_set_font(f_main);
draw_text_ext(gui_width_ / 2, 200, instructions_, 18, 520);

// Draw the splitters instructions
draw_text_ext(gui_width_ / 2, 350, splitters_, 18, 520);

// -- Draw some example splitters -- //

// Example one
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 - 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 - 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_uni_one, image_index, gui_width_ / 2 - 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example two
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 - 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 - 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_uni_two, image_index, gui_width_ / 2 - 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example three
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 - 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 - 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_uni_three, image_index, gui_width_ / 2 - 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example four
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 - 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 - 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_one, image_index, gui_width_ / 2 - 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example five
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 - 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 - 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_two, image_index, gui_width_ / 2 - 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example six
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_three, image_index, gui_width_ / 2, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example seven
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 + 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 + 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_four, image_index, gui_width_ / 2 + 50, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example eight
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 + 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 + 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_five, image_index, gui_width_ / 2 + 100, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example nine
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 + 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 + 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_duo_six, image_index, gui_width_ / 2 + 150, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example ten
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 + 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 + 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_tri_one, image_index, gui_width_ / 2 + 200, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Example eleven
draw_sprite_ext(s_splitter_base, 0, gui_width_ / 2 + 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_base, 2, gui_width_ / 2 + 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(s_splitter_tri_two, image_index, gui_width_ / 2 + 250, 400, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Draw the filters instructions
draw_text_ext(gui_width_ / 2, 510, filters_, 18, 520);

// Draw some example filters
draw_sprite_ext(s_filter, image_index, gui_width_ / 2 - 96, 550, image_xscale, image_yscale, image_angle, make_color_rgb(255, 0, 0), 1);
draw_sprite_ext(s_filter, image_index, gui_width_ / 2, 550, image_xscale, image_yscale, image_angle, make_color_rgb(0, 255, 0), 1);
draw_sprite_ext(s_filter, image_index, gui_width_ / 2 + 96, 550, image_xscale, image_yscale, image_angle, make_color_rgb(0, 0, 255), 1);

// Draw the switches instructions
draw_text_ext(gui_width_ / 2, 670, switches_, 18, 520);

// Draw some example switches
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 - 192, 730, image_xscale, image_yscale, image_angle, make_color_rgb(255, 0, 0), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 - 128, 730, image_xscale, image_yscale, image_angle, make_color_rgb(0, 255, 0), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 - 64, 730, image_xscale, image_yscale, image_angle, make_color_rgb(0, 0, 255), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2, 730, image_xscale, image_yscale, image_angle, make_color_rgb(255, 255, 0), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 + 64, 730, image_xscale, image_yscale, image_angle, make_color_rgb(0, 255, 255), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 + 128, 730, image_xscale, image_yscale, image_angle, make_color_rgb(255, 0, 255), 1);
draw_sprite_ext(s_switch, image_index, gui_width_ / 2 + 192, 730, image_xscale, image_yscale, image_angle, make_color_rgb(255, 255, 255), 1);