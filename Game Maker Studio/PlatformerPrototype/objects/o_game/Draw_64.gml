/// @description Draw FPS

// Calculate FPS and handle the timer
//fps_timer -= 1; //Reduce timer
//if (fps_timer <= 0 ) {
//	fps_amount = fps_real; // Update FPS
//	fps_timer = 30;		  // Reset FPS timer
//}

// Draw FPS
//draw_text(20, 20, "FPS: " + string(round(fps_amount)));

//if (instance_exists(o_camera)) { draw_text(20, 40, string(o_camera.zoom_)); }

//if (instance_exists(o_par_camera_anchor)) {
	//var _inst = instance_nearest(o_player.x, o_player.y, o_par_camera_anchor);
	//if (_inst != noone) {
	//	//var _distance = point_distance(_inst.x, _inst.y, _inst.x - (_inst.sprite_width / 2), _inst.y - (_inst.sprite_height / 2));
	//	draw_text(20, 80, _inst._dist);
	//}
	//draw_text(20, 60, o_par_camera_anchor.anchor_);
//}