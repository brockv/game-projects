/// @description draw_laser(x1, x2, y1, y2, width, color)
/// @param x1
/// @param x2
/// @param y1
/// @param y2
/// @param width
/// @param color

// This draws a line between two coordinates to look like a laser

// Set variables
x1 = argument[0];
x2 = argument[1];
y1 = argument[2];
y2 = argument[3];
ww = argument[4];
cc = argument[5];

// Set the draw color to the one passed in
draw_set_color(cc);

// Draws three lines with different thicknesses and blend modes to make a laser looking line
draw_set_alpha(0.05);
draw_line_width(x1, x2, y1, y2, ww * 8);
draw_line_width(x1, x2, y1, y2, ww * 7);
draw_line_width(x1, x2, y1, y2, ww * 6);
draw_set_alpha(0.1);
draw_line_width(x1, x2, y1, y2, ww * 4);
draw_line_width(x1, x2, y1, y2, ww * 3);
draw_set_alpha(0.2);
draw_line_width(x1, x2, y1, y2, ww * 2);
draw_set_alpha(0.3);
draw_line_width(x1, x2, y1, y2, ww * 1.5);
gpu_set_blendmode(bm_add);
draw_set_alpha(0.6);
draw_line_width(x1, x2, y1, y2, ww);
draw_set_color(c_white);
draw_set_alpha(0.2);
draw_line_width(x1, x2, y1, y2, ww / 2);
draw_set_alpha(1);
gpu_set_blendmode(0);