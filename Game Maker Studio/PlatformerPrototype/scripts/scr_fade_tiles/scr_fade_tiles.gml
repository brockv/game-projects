//// Fade tiles in and out
//// argument0 = base tile layer.
//// argument1 = destination tile alpha.
//for (var layer = argument[0]; layer >= argument[0]-2; layer -= 1) // Check the three layers associated with the hidden area.
//// ^ This part isn't even needed in your project, but it is in mine.
////   It is safe to leave in, since it won't run the below for loop if there are no tiles.
//{
//    var tiles = tile_get_ids_at_depth(layer); // Find id of every tile on a layer.
//    for (var i = 0; i < array_length_1d(tiles); i++;) // Only run this loop enough times to grab each tile.
//        { if (tile_exists(tiles[i])) tile_set_alpha(tiles[i],argument[1]); } // If the tile exists, change the alpha.
//}