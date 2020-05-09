/// @description Initialize the sprite

part_sys_ = part_system_create();
part_system_draw_order(part_sys_, true);
body_emitter_ = part_emitter_create(part_sys_);

body_part_ = part_type_create();
part_type_shape(body_part_, pt_shape_sphere);
part_type_size(body_part_, 0.2, 0.5, -0.05, 0);
part_type_speed(body_part_, 0, 0.01, 0, 0);
part_type_direction(body_part_, 0, 360, 0, 10);
part_type_color1(body_part_, c_white);
part_type_life(body_part_, room_speed/2, room_speed);
part_emitter_stream(part_sys_, body_emitter_, body_part_, 10);

//// Have the sprite face left
//image_xscale = -1;

//// No animations
//image_speed = 0;