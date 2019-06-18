/// @description Destroy the Grid

if (ds_exists(ds_depth_grid_, ds_type_grid)) {
	ds_grid_destroy(ds_depth_grid_);
}
