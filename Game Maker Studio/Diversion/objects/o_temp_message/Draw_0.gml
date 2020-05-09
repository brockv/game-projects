/// @description Draw a prompt

// Draw self
draw_self();

// Set the draw varaibles
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

// Draw and additional message
draw_set_font(f_selected);
draw_text(room_width / 2, room_height / 2 + 100, "Thank you for playing!");

// Draw the prompt
draw_set_font(f_main);
draw_text(room_width / 2, room_height / 2 + 200, "(Click anywhere to return to the title)");
