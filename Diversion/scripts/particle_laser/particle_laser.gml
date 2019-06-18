///@description particle_laser(color)
///@arg color


// Get color variable
var _color = argument[0]

// Create the particle system
part_system_ = part_system_create()

// Create and define the particle type
particle_ = part_type_create();
part_type_shape(particle_, pt_shape_spark);
part_type_size(particle_, 0.1, 0.2, 0, 0);
part_type_scale(particle_, 1, 1);
part_type_color1(particle_, _color);
part_type_alpha3(particle_, 1, 1, 0);
part_type_speed(particle_, 0.40, 1, -0.01, 0);
part_type_direction(particle_, 0, 359, 0, 0);
part_type_gravity(particle_, 0, 270);
part_type_orientation(particle_, 0, 0, 0, 0, 1);
part_type_blend(particle_, 1);
part_type_life(particle_, 10, 20);

// Create an emitter for the particle system
part_emitter_ = part_emitter_create(part_system_);