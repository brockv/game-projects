///// @description Reinitialize the particle body

//// Flip persistent off after the transition
//persistent = false;

//if (start_position_ != noone) {
//	x = start_position_.x;
//	y = start_position_.y;
//}

//#region // Player particle system
//// Create the particle system for the player's body
//part_sys_ = part_system_create();
//part_system_draw_order(part_sys_, true);
//body_emitter_ = part_emitter_create(part_sys_);

//// Create the particle for the main body
//body_part_ = part_type_create();
//part_type_shape(body_part_, pt_shape_sphere);
//part_type_size(body_part_, 0.2, 0.5, -0.05, 0);
//part_type_speed(body_part_, 0, 0.01, 0, 0);
//part_type_direction(body_part_, 0, 360, 0, 10);
//part_type_color1(body_part_, color_);
//part_type_life(body_part_, room_speed/2, room_speed);
//part_emitter_stream(part_sys_, body_emitter_, body_part_, 10);

//// Create the particle for jump effects
//jump_part_ = part_type_create();
//part_type_shape(jump_part_, pt_shape_sphere);
//part_type_size(jump_part_, 0.2, 0.8, -0.05, 0);
//part_type_speed(jump_part_, 1, 3, 0, 0);
//part_type_direction(jump_part_, 160, 380, 0, 10);
//part_type_color1(jump_part_, color_);
//part_type_life(jump_part_, room_speed/2, room_speed);

//// Create the particle for wall slide effects
//wall_part_ = part_type_create();
//part_type_shape(wall_part_, pt_shape_sphere);
//part_type_size(wall_part_, 0.01, 0.05, -0.01, 0);
//part_type_speed(wall_part_, 1, 3, 0, 0);
//part_type_direction(wall_part_, 260, 280, 0, 10);
//part_type_gravity(wall_part_, .5, 270);
//part_type_color1(wall_part_, color_);
//part_type_life(wall_part_, 10, 20);
//#endregion
