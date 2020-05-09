///@arg x
///@arg y

// Script argument variables
var _x = argument[0];
var _y = argument[1];

// The tilemap to use for hidden areas
var _tilemap = layer_tilemap_get_id("Bomb_Walls");

return tilemap_get_at_pixel(_tilemap, _x, _y);
