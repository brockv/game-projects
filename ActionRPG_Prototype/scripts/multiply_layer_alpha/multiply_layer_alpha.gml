// Initialize the variables for the shader
//var _hidden_tilemap = layer_get_id("Tiles_Hidden_Area");
var _uniformID = shader_get_uniform(sh_multiply_alpha, "alpha");
var _alpha = 0.5 + lengthdir_x(0.5, current_time / 10);

// Set the shader for the designated layer
//layer_shader(_hidden_tilemap, sh_multiply_alpha);

// Pass the value into the shader
shader_set_uniform_f(_uniformID, _alpha);

