/// @description Initialize variables

// Node type enum
enum node_type {
    normal,
    fallthrough,
    wall,
}

// AI Entity state enum
enum state {
    normal,
    wall_slide,
    ledge_grab,
    idle,
    drawing_left,
    drawing_right,
    pathing,
    grid,
}



// Set up
draw_set_colour(c_white);
xx = 0;
yy = 0;
global.test_mode = false;
//global.draw_paths = false;
//entity = noone;
state = state.idle;
//global.font = font_add_sprite(sprFont, ord("&"), true, 1);




