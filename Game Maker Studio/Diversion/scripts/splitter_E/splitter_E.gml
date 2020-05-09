///@description splitter_E(color)

// Assign argument[0] for clarity
var _color = argument[0];

// Detects whether the splitter is activated, and then shoots the laser in a certain direction
if (active_) {
    xx_ = x + lengthdir_x(22, image_angle);
    yy_ = y + lengthdir_y(22, image_angle);
    dir_ = image_angle;
    laser(2000, 5, _color);
}