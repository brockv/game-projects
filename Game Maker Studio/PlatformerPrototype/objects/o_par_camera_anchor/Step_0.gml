/// @description Step logic

if (instance_exists(o_player)) {
	mid_x_ = o_player.x;
	mid_y_ = o_player.y - o_player.sprite_height / 2;
	if (instance_exists(o_camera)) {
		var _width = camera_get_view_width(view_camera[0]);
		var _height = camera_get_view_height(view_camera[0]);
		
		var _anchor = instance_nearest(o_player.x, o_player.y - o_player.sprite_height / 2, o_par_camera_anchor);
		with (_anchor) {
			//max_focal_range_ = point_distance(x, y, x - (sprite_width / 2), y - (sprite_height / 2));
			//var _distance = point_distance(x, y, o_player.x, o_player.y - o_player.sprite_height / 2);
			var _in_anchor = point_in_rectangle(o_player.x, o_player.y - o_player.sprite_height / 2,
												x - (width_ / 2), y - (height_ / 2), x + (width_ / 2), y + (height_ / 2));
				
			//if (_distance < max_focal_range_) {
			if (_in_anchor) {
				o_camera.camera_target_ = _anchor;
				o_camera.lerp_ = 0.06;
				//x = xstart + ((o_player.x - xstart) / 2);
				//y = ystart + ((o_player.y - ystart) / 2);
			
				// Calculate the zoom percentage and the new width and height
				o_camera.zoom_ = clamp(width_ / height_, 1, 1.20);
				var _width = lerp(_width, view_width * o_camera.zoom_, 0.04);
				var _height = lerp(_height, view_height * o_camera.zoom_, 0.04);			
			
				// Set the new view size and resize the surfaces
				camera_set_view_size(view_camera[0], _width, _height);
				surface_resize(application_surface, _width, _height);
				if (surface_exists(o_aura_control.aura_surface)) {
					surface_resize(o_aura_control.aura_surface, _width + 32, _height + 32);
				}
			
				// Set the new view position
				camera_set_view_pos(view_camera[0], (x - (_width / 2)) + screenshake_amount_x,
													(y - (_height / 2)) + screenshake_amount_y);
			
				// Clamp the new view position
				camera_set_view_pos(view_camera[0], 
				clamp(camera_get_view_x(view_camera[0]), 0, room_width - _width),
				clamp(camera_get_view_y(view_camera[0]), 0, room_height - _height));
			} else {
				anchor_ = noone;
				o_camera.camera_target_ = o_player;
				o_camera.lerp_ = 0.04;
				//o_camera.lerp_ = o_camera.default_lerp_;
			
				//x = xstart;
				//y = ystart;
				o_camera.zoom_ = 1;
				var _width = lerp(_width, view_width * o_camera.zoom_, 0.04);
				var _height = lerp(_height, view_height * o_camera.zoom_, 0.04);
			
				// Set the new view size and resize the surfaces
				camera_set_view_size(view_camera[0], _width, _height);
				surface_resize(application_surface, _width, _height);
				if (surface_exists(o_aura_control.aura_surface)) {
					surface_resize(o_aura_control.aura_surface, _width + 32, _height + 32);
				}
			
				// Set the view position
				camera_set_view_pos(view_camera[0], (o_camera.x - (_width / 2)) + screenshake_amount_x,
													(o_camera.y - (_height / 2)) + screenshake_amount_y);
			
				// Clamp the new view position
				camera_set_view_pos(view_camera[0], clamp(camera_get_view_x(view_camera[0]), 0, room_width - _width),
													clamp(camera_get_view_y(view_camera[0]), 0, room_height - _height));
			}
		}
	}
} else {
	o_camera.camera_target_ = noone;
}
