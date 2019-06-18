/// @function					Aura_Shadow_Caster_Tile_Init(tile_width, tile_height, visible);
/// @description				Create shadow caster vertex data from a tilemap
/// @param {real}	tile_width	The width of a single tile cell (in pixels)
/// @param {real}	tile_height	The heigth of a single tile cell (in pixels)
/// @param {bool}	visible		Set the tile layer used to visible (true) or not (false)
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

// This will initialise a tile map from the room editor as a shadow caster.
// You give the width and height of a single tile cell as well as the layer 
// to use (this can be a dynamic layer created before the shadow caster is
// initialised or a layer from the room editor) and the script will go through 
// the layer data and generate a series of shadow caster vertices based on
// the position of the tiles. You can also flag the layer as being visible
// or not and the script will enable/disable it for you. If the shadow vertices
// are created correctly the script returns "true" otherwise it will return "false"

if (instance_exists(o_aura_control)) {
	var _l = o_aura_control.aura_tiles;
	if (_l > -1 && layer_exists(_l)) {
		// Create temp objects at all the tile positions.
		// This is required so that we can optimise the vertex count for the shadow casters
		var _inst_layer = layer_create(10000);
		var _tmap_layer = layer_tilemap_get_id(_l);
		for (var i = 0; i < room_width; i+= argument[0];) {
			for (var j = 0; j < room_height; j+= argument[1];) {
				var _td = tilemap_get_at_pixel(_tmap_layer, i, j);
				if (!tile_get_empty(_td)) {
					// IMPORTANT!
					// This object MUST have a sprite that is the same size as a single tile cell!
					with (instance_create_layer(i, j, _inst_layer, o_aura_shadow_caster_tiles)) {
						initial_width = sprite_get_width(sprite_index);
						initial_height = sprite_get_height(sprite_index);
						xorigin = sprite_get_xoffset(sprite_index);
						yorigin = sprite_get_yoffset(sprite_index);
					}
				}
			}
		}
		// Optimise the temporary objects. This simply "expands" the objects to 
		// create as large an area as possible. We will then use the corner vertices
		// of these objects to generate the shadow mesh
		var _wall = o_aura_shadow_caster_tiles;
		var _obj = noone;
		repeat (2) {
			with (_wall) {
			    _obj = instance_place(x + 1, y, _wall);
			    if (instance_exists(_obj)) {
			        if (_obj.sprite_height == sprite_height) && (_obj.y == y) && (bbox_right + 1 = _obj.bbox_left) {
			            var bx = bbox_left;
			            image_xscale = (sprite_width + _obj.sprite_width) / initial_width;
			            x = bx + xorigin * image_xscale;
			            with (_obj) instance_destroy();
			        }
			    }
			    _obj = instance_place(x - 1, y, _wall);
			    if (instance_exists(_obj)) {
			        if (_obj.sprite_height == sprite_height) && (_obj.y == y) && (_obj.bbox_right + 1 == bbox_left) {
			            image_xscale = (sprite_width + _obj.sprite_width) / initial_width;
			            x = _obj.bbox_left + xorigin * image_xscale;
			            with (_obj) instance_destroy();
			        }
			    }
			} 
			with (_wall) {
			    _obj = instance_place(x, y + 1, _wall);
			    if (instance_exists(_obj)) {
			        if (_obj.sprite_width == sprite_width) && (_obj.x == x) && (bbox_bottom + 1 == _obj.bbox_top) {
			            var by = bbox_top;
			            image_yscale = (sprite_height + _obj.sprite_height) / initial_height;
			            y = by + yorigin * image_yscale;
			            with (_obj) instance_destroy();
			        }
			    }   
			    _obj = instance_place(x, y - 1, _wall);
			    if (instance_exists(_obj)) {
			        if (_obj.sprite_width = sprite_width) && (_obj.x = x) && (_obj.bbox_bottom + 1 = bbox_top) {
			            image_yscale = (sprite_height + _obj.sprite_height) / initial_height;
			            y = _obj.bbox_top + yorigin * image_yscale;
			            with (_obj) instance_destroy();
			        }
			    }
			}
		}
		// Add the tilemap shadow vertex data into the AURA tile vertex list
		var _list = o_aura_control.aura_tile_list;
		with (_wall) {
			var pos = ds_list_size(_list);
			ds_list_add(_list, ds_map_create());
			ds_map_add(_list[| pos], "x1", bbox_left);
			ds_map_add(_list[| pos], "y1", bbox_top);
			ds_map_add(_list[| pos], "x2", bbox_right);
			ds_map_add(_list[| pos], "y2", bbox_top);
			ds_map_add(_list[| pos], "x3", bbox_right);
			ds_map_add(_list[| pos], "y3", bbox_bottom);
			ds_map_add(_list[| pos], "x4", bbox_left);
			ds_map_add(_list[| pos], "y4", bbox_bottom);
			// Destroy the temp object and move on
			instance_destroy();
		}
		// Switch off the tilemap shadow caster layer if required
		layer_set_visible(_l, argument[2]);
		// EXPERIMENTAL! This will set the length of the shadow cast by lights
		// To be honest, I'm not too happy with how this looks and recommend 
		// that it'snot used, but it may be useful to some people or for specific
		// effects...
		if (argument_count > 3) {
			o_aura_control.aura_tile_length = argument[3];
		}
		return true;
	} else {
		show_debug_message("Tilemap shadow caster not initialised. Invalid (or non-exisiting) tile layer given!");
		o_aura_control.aura_tiles = -1;
		return false;
	}
} else {
	show_debug_message("Tilemap shadow caster not initialised. No AURA controller found!");
	return false;
}