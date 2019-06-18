/// @description Draw Logic

if (ds_exists(ds_depth_grid_, ds_type_grid)) {
	// Assign the grid for local use
	var _depth_grid = ds_depth_grid_;
	
	// Check the current number of instances we need to draw
	var _grid_height = instance_number(o_depth_parent);
	
	// Exit if there are no instances to draw
	if (_grid_height == 0) exit;
	
	// Resize the current grid
	ds_grid_resize(_depth_grid, 2, _grid_height);
	
	// Set a starting point for the grid
	var _yy = 0;
		
	with (o_depth_parent) {
		// Add ourselves to the grid
		_depth_grid[# 0, _yy] = id;
		
		// Add our y value to the grid
		_depth_grid[# 1, _yy] = y;
		
		// Increment the insertion point
		_yy++;
	}
	
	// Sort the grid in ascending order
	ds_grid_sort(_depth_grid, 1, true);
	
	// Draw all instances in that order
	var _y = 0;
	repeat(_grid_height) {
		// Draw the instance
		var _instance_id = _depth_grid[# 0, _y];
		with (_instance_id) {
			draw_self();
		}
		
		// Increment the counter
		_y++;
	}
	
	// Clear the grid after all instances have been drawn
	ds_grid_clear(_depth_grid, 0);
}

// Draw the mask used for silhouettes
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);

draw_set_alpha(0);

// Get the position of the camera in the room
var _cam = view_camera[0];
var _cx  = camera_get_view_x(_cam);
var _cy  = camera_get_view_y(_cam);
var _w   = camera_get_view_width(_cam);
var _h   = camera_get_view_height(_cam);

// Draw the mask using the camera position
draw_rectangle(_cx, _cy, _cx + _w, _cy + _h, false);
draw_set_alpha(1);

gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);
