/// @description Tile tests

//if (!instance_exists(o_player)) exit;

//tile_x = tilemap_get_cell_x_at_pixel(map_id, x, y) * TILESIZE;
//tile_y = tilemap_get_cell_y_at_pixel(map_id, x, y) * TILESIZE;

////if (!collision_circle(tile_x, tile_y, o_player.radius_, o_par_collision, false, true)) {
//if (distance_to_point(tile_x, tile_y) > (x + o_player.radius_ + 10)) {
//	gridX = floor(x / TILESIZE);
//    gridY = floor(y / TILESIZE);
	
//	starting_tile = tilemap_get_at_pixel(map_id, gridX, gridY);
	
//	//if (starting_tile == -4) {
//	//	starting_tile = tilemap_get(map_id, gridX, gridY);
//	//}
	
//    tilemap_set(map_id, 22, gridX, gridY);
//	//tilemap_set(map_id, starting_tile, gridX, gridY);
//} else {	
//	gridX = floor(x / TILESIZE);
//    gridY = floor(y / TILESIZE);
//	starting_tile = tilemap_get_at_pixel(map_id, gridX, gridY);
//	tilemap_set(map_id, starting_tile, gridX, gridY);
//	//tilemap_set_at_pixel(map_id, 22, gridX, gridY);
//}