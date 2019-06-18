_player_layer = layer;

// Create our player if theyr don't exist on room start
if (!instance_exists(o_player)) instance_create_layer(x, y - sprite_height - 2, layer, o_player);
