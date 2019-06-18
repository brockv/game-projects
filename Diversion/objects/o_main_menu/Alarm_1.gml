/// @description Generate colors

// Generate to random colors
randomize();
col_one_ = make_color_hsv(random(255), 255, 255);
col_two_ = make_color_hsv(clamp(random(255) + 25, 26, 255), 255, 255);

// Reset the alarm
alarm[1] = 30;
