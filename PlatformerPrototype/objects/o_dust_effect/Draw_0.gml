/// @description Draw effect

// Set the draw style
if (solid_colour != noone) {
	gpu_set_fog(true, solid_colour, 0, 1);
}

// Draw the effect
draw_self();

// Reset the draw style
if (solid_colour != noone) {
    gpu_set_fog(0, 0, 0, 0);
}


