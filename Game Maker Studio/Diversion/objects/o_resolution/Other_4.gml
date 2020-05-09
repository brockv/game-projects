/// @description Configure resolution on room start

if (room != r_init) resolution_configure();

// Update the color of the background for each room
layer_id_ = layer_get_id("Background");
background_id_ = layer_background_get_id(layer_id_);
layer_background_blend(background_id_, global.background_color_);

