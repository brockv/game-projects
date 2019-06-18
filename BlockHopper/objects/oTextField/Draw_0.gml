draw_set_font(font); // set the font

draw_set_color(c_white); // set the color to white

// if locked, set the color to gray
if (locked == true) {
    draw_set_color(c_dkgray);
}

// set the alpha based on whether or not the box is active
draw_set_alpha(0.1 + (0.1 * in ));
draw_rectangle(x - padding, y - padding, x + width + padding, y + height + padding, false); // draw the rectangle
draw_set_alpha(1); // reset the alpha
draw_set_halign(halign); // set the horizontal text alignment
draw_set_valign(fa_center); // set the vertical text alignment

txt = text; // placeholder for text variable

// if the text is in a password field, secure the text with asterixis
if (ID == 2) {
    txt = secure(text);
}
switch (halign) { // switch between possible horizontal alignment types to draw the text in the necessary location
    case (fa_left):
        draw_text(x, y + height / 2, string_hash_to_newline(txt));
        break;
    case (fa_center):
        draw_text(x + width / 2, y + height / 2, string_hash_to_newline(txt));
        break;
    case (fa_right):
        draw_text(x + width, y + height / 2, string_hash_to_newline(txt));
        break;
}

