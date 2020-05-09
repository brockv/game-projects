///@description splitter_N(color)

// Assign argument[0] for clarity
var _color = argument[0];

// Detects whether the splitter is activated, and then shoots the laser in a certain direction
if (active_) {
    xx_ = x + lengthdir_x(21, image_angle + 90);
    yy_ = y + lengthdir_y(21, image_angle + 90);
    dir_ = image_angle + 90;
    laser(2000, 5, _color);
}