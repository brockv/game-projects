/// @description Game End Logic

// Save the current state of the map
//ds_map_secure_save(save_data_, file_name_);

// Destroy the map to prevent a memory leak
ds_map_destroy(save_data_);
