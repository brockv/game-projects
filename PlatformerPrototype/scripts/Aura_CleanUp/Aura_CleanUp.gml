/// @function		scr_Aura_CleanUp();
/// @description	Free the surfaces etc... used at the end of the room.

// This should be called in the Clean Up Event in the main controller instance.

// Free up the light surfaces
with (o_aura_light_parent) {
	Aura_Light_Free();
}

// Free up the main AURA surface
if (surface_exists(aura_surface)) {
	surface_free(aura_surface);
}

// Free up the vertex buffer and vertex format
vertex_delete_buffer(aura_s_buffer);
vertex_format_delete(aura_v_format);

// Free up tilemap shadow caster data if anabled
if (aura_tiles != -1) {
	for (var i = 0; i < ds_list_size(aura_tile_list); i++;)	{
		ds_map_destroy(aura_tile_list[| i]);
	}
	ds_list_destroy(aura_tile_list);
}
