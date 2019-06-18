/// @description node_connect(node)
/// @param node
/*
 * Connect this node (the calling object) to another node
 * by adding it to the map of connections.
 */
var node = argument0;
if (!ds_map_exists(connections, node))
{
    ds_map_add(connections, node, node_distance(id, node));
}

