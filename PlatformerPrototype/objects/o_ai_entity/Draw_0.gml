///@description Draw logic

// Inherit from o_pathfinding_object
event_inherited();

// Draw entity
draw_sprite_ext(sprite_index, image_index, x, y, xscale * facing, yscale, image_angle, image_blend, image_alpha);

// For test mode, draw a box showing the entity's bounding box
if (global.test_mode) {
    draw_set_color(c_red);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    draw_set_color(c_white);
}





