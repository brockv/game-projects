/// @description Initialize the sprite

part_sys = part_system_create();
part_system_draw_order(part_sys, true);
body_emitter = part_emitter_create(part_sys);

body_part = part_type_create();
part_type_shape(body_part, pt_shape_sphere);
part_type_size(body_part, 0.2, 0.5, -0.05, 0);
part_type_speed(body_part, 0, 0.01, 0, 0);
part_type_direction(body_part, 0, 360, 0, 10);
part_type_color1(body_part, c_white);
part_type_life(body_part, room_speed/2, room_speed);
part_emitter_stream(part_sys, body_emitter, body_part, 10);

//// Have the sprite face left
//image_xscale = -1;

//// No animations
//image_speed = 0;