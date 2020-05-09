/// @description splitter_SE(color)

// Assign argument[0] for clarity
var _color = argument[0];

// Detects whether the splitter is activated, and then shoots the laser in a certain direction
if (active_) {
    xx_ = x + lengthdir_x(20, image_angle - 45);
    yy_ = y + lengthdir_y(20,image_angle - 45);
    dir_ = image_angle - 45;
    laser(2000, 5, _color);
}