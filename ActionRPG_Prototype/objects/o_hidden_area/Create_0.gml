/// @description Initialize Variables

// Set initial alpha value
alpha_ = 1;

// Fading variables
FADE_OUT_ = 0;
FADE_IN_ = 1;
fading_ = false;

// Set the boundaries
left_boundary_ = x;
top_boundary_ = y;
right_boundary_ = left_boundary_ + sprite_width;
bottom_boundary_ = top_boundary_ + sprite_height;

//// The tilemap hidden areas are located on
//hidden_tilemap_ = layer_get_id("Tiles_Hidden_Area");
uniformID_ = shader_get_uniform(sh_multiply_alpha, "alpha");

////layer_shader(hidden_tilemap_, sh_multiply_alpha);
//layer_script_begin(hidden_tilemap_, multiply_layer_alpha());

outline_surf = surface_create(room_width, room_height);

surface_set_target(outline_surf); 
tileMapA = layer_tilemap_get_id(layer_get_id("Tiles_Hidden_Area"));
draw_tilemap(tileMapA, 0, 0);
surface_reset_target();

