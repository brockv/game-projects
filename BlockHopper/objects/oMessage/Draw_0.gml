// destroy the object on a key press
if (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter)) {
    instance_destroy();
}

// soft fade in
if (alpha < 0.5) {
    alpha += (0.5 - alpha) / 5;
}

// soft movement in
if ( in > 0) { in -= ( in ) / 5;
}

draw_set_color(c_black); // set the color to black
draw_set_alpha(alpha); // set the visibility to alpha
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), false); // flood view with rectangle
draw_set_alpha(1); // reset the alpha

padding = 16; // text padding
width = 480; // max width of the box

draw_set_font(fntMessage); // set the font
draw_set_halign(fa_center); // set the halign
draw_set_valign(fa_center); // set the valign

// set the width (w) and height (h) of the text box
w = string_width_ext(string_hash_to_newline(text), font_get_size(fntMessage) * 1.25, width);
h = string_height_ext(string_hash_to_newline(text), font_get_size(fntMessage) * 1.25, width);

draw_set_color(make_color_rgb(231, 76, 60)); // set the color

// draw the rectangle in the center of the room taking into account text width and height
draw_rectangle(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2) - (w / 2) - padding, __view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 ) / 2) - (h / 2) - padding - in ,
    __view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2) + (w / 2) + padding, __view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 ) / 2) + (h / 2) + padding - in , false);

// set the color to white and draw the text above the message box
draw_set_color(c_white);
draw_text_ext(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2) - in , string_hash_to_newline(text), font_get_size(fntMessage) * 1.25, width);

// destroy via mouse if visible briefly (ensures rapid clicking will not lead to unintended results
if (alpha > 0.4) {
    if mouse_check_button_pressed(mb_left) {
        instance_destroy();
    }
}

