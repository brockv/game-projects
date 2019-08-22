/// @description Initialize variables

part_sys_ = part_system_create();
part_system_draw_order(part_sys_, true);

jump_part_ = part_type_create();
part_type_shape(jump_part_, pt_shape_sphere);
part_type_size(jump_part_, 0.5, 1, -0.05, 0);
part_type_speed(jump_part_, 1, 3, 0, 0);
part_type_direction(jump_part_, 160, 380, 0, 10);
part_type_color1(jump_part_, c_white);
part_type_life(jump_part_, room_speed/2, room_speed);

part_particles_create(part_sys_, x, y, jump_part_, 15);
alarm[0] = room_speed / 2;