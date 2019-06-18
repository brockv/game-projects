/// @description node_distance(node1, node2)
/// @param node1
/// @param  node2
/*
 * Returns the distance (in points, not pixels) between 2 nodes,
 * taking screen wrapping in to consideration if necessary.
 */
var n1 = argument0;
var n2 = argument1;
var n2x = get_node_x(n1.x, n1.y, n2);
return (round(point_distance(n1.x, n1.y, n2x, n2.y)/10));

