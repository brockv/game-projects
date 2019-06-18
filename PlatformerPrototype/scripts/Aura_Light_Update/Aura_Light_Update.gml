/// @function						Aura_Light_Update(vertex_format, vertex_buffer);
/// @description					Update an individual light
/// @param {ptr}	vertex_format	The vertex format to use
/// @param {ptr}	vertex_buffer	The vertex buffer to use

// This script should only be called from the main Aura_Update() script, and 
// you shouldn't ever need to call this from within a game project.

// Here all the main drawing for each light is done. It also uses two extra 
// "helper" scripts to check for collisions and to check the light is in the view.

// Set up the variables
var a_vf = argument[0];
var a_sb = argument[1];

var a_tx, a_ty, i, a_dir, a_inst, a_rad, a_px, a_py, a_ox, a_oy;
var _v = aura_view;
var _t = aura_tiles;

// Update the lights
with (o_aura_light_parent) {
	if (aura_light_enabled) {
		// Check the light surface exists
		if (!surface_exists(aura_light_surface)) {
			Aura_Light_ReInit(25);
		} else {
			// Check if it is to be updated and is in the view
			if (aura_light_update && in_view(_v)) {
				// Set surface
				surface_set_target(aura_light_surface);
				draw_clear_alpha(c_black, 1);
			
				// Draw the light sprite
				draw_sprite_ext(sprite_index, image_index, aura_light_radius, aura_light_radius, image_xscale, image_yscale, image_angle, c_white, 1);
            
				//making a temp object variable for the with loop.
				a_inst = id;
				a_rad = aura_light_radius;
				a_ox = x;
				a_oy = y;
            
				//loop through all shadow casters, adding to the vertex buffer for each
				vertex_begin(a_sb, a_vf); 
				with (o_aura_shadow_caster_parent) {
					if (in_light(a_inst)) {
						// Loop through the shadow caster vertices and add them to the vertex buffer
						for (i = 0; i < aura_shadow_points; i++;) {
	                        a_tx[i] = x + aura_shadow_x[i] - a_ox + a_rad;
	                        a_ty[i] = y + aura_shadow_y[i] - a_oy + a_rad;
	                        a_dir = point_direction(a_tx[i], a_ty[i], a_rad, a_rad) + 180;
	                        a_px[i] = a_tx[i] + lengthdir_x(aura_shadow_length, a_dir);
	                        a_py[i] = a_ty[i] + lengthdir_y(aura_shadow_length, a_dir);
                        }
						for (i = 0; i < aura_shadow_points; i++;) {
							if (i != aura_shadow_points - 1) {
	                            vertex_position(a_sb, a_tx[i], a_ty[i]);
	                            vertex_colour(a_sb, c_black, 1); 
	                            vertex_position(a_sb, a_px[i], a_py[i]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_tx[i + 1], a_ty[i + 1]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_px[i], a_py[i]);
	                            vertex_colour(a_sb, c_black, 1); 
	                            vertex_position(a_sb, a_px[i + 1], a_py[i + 1]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_tx[i + 1], a_ty[i + 1]);
	                            vertex_colour(a_sb, c_black, 1);
                            } else {
	                            vertex_position(a_sb, a_tx[i], a_ty[i]);
	                            vertex_colour(a_sb, c_black, 1); 
	                            vertex_position(a_sb, a_px[i], a_py[i]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_tx[0], a_ty[0]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_px[i], a_py[i]);
	                            vertex_colour(a_sb, c_black, 1); 
	                            vertex_position(a_sb, a_px[0], a_py[0]);
	                            vertex_colour(a_sb, c_black, 1);
	                            vertex_position(a_sb, a_tx[0], a_ty[0]);
	                            vertex_colour(a_sb, c_black, 1);
                            }
                        }
                    }
                }
				if (_t) {
					a_len = o_aura_control.aura_tile_length;
					for (var _a = 0; _a < ds_list_size(o_aura_control.aura_tile_list); _a++;) {
						var _map = o_aura_control.aura_tile_list[| _a];
						a_tx[0] = _map[? "x1"] - a_ox + a_rad;
						a_ty[0] = _map[? "y1"] - a_oy + a_rad;
						a_tx[1] = _map[? "x2"] - a_ox + a_rad;
						a_ty[1] = _map[? "y2"] - a_oy + a_rad;						
						a_tx[2] = _map[? "x3"] - a_ox + a_rad;
						a_ty[2] = _map[? "y3"] - a_oy + a_rad;						
						a_tx[3] = _map[? "x4"] - a_ox + a_rad;
						a_ty[3] = _map[? "y4"] - a_oy + a_rad;
						for (i = 0; i < 4; i++;) {
							a_dir = point_direction(a_tx[i], a_ty[i], a_rad, a_rad) + 180;
							a_px[i] = a_tx[i] + lengthdir_x(a_len, a_dir);
							a_py[i] = a_ty[i] + lengthdir_y(a_len, a_dir);
						}
						for (i = 0; i < 4; i++;) {
							if (i != 3) {
			                    vertex_position(a_sb, a_tx[i], a_ty[i]);
			                    vertex_colour(a_sb, c_black, 1); 
			                    vertex_position(a_sb, a_px[i], a_py[i]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_px[i], a_py[i]);
			                    vertex_colour(a_sb, c_black, 1); 
			                    vertex_position(a_sb, a_px[i + 1], a_py[i + 1]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(a_sb, c_black, 1);
		                    } else {
			                    vertex_position(a_sb, a_tx[i], a_ty[i]);
			                    vertex_colour(a_sb, c_black, 1); 
			                    vertex_position(a_sb, a_px[i], a_py[i]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_tx[0], a_ty[0]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_px[i], a_py[i]);
			                    vertex_colour(a_sb, c_black, 1); 
			                    vertex_position(a_sb, a_px[0], a_py[0]);
			                    vertex_colour(a_sb, c_black, 1);
			                    vertex_position(a_sb, a_tx[0], a_ty[0]);
			                    vertex_colour(a_sb, c_black, 1);
		                    }
						}
                    }
				}
				vertex_end(a_sb);
				vertex_submit(a_sb, pr_trianglelist, -1);
				surface_reset_target();
				// Check to see if static
				if (aura_light_static) {
					aura_light_update = false;
                }
            }
        }
    }
}
