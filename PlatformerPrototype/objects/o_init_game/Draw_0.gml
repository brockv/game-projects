/// @description Debug line

// Draw a line from the nearest camera anchor to the player
//if (instance_exists(o_player)) {
//	var _inst = instance_nearest(o_player.x, o_player.y, o_par_camera_anchor);
//	with (o_par_camera_anchor) {
//		if (_inst = id) {
//			draw_set_color(c_red)
//			draw_line(o_player.x, o_player.y, _inst.x, _inst.y);
//			draw_set_color(c_white)
//		} else {
//			instance_deactivate_object(_inst);
//		}
//	}
//}