/// @description get_node_x(x, y, node, can_wrap)
/// @param x
/// @param  y
/// @param  node
/// @param  can_wrap
/*
 * Get the x position of a node, taking room wrapping
 * in to consideration in relation to the given x & y position
 *
 * Returns the X or WRAPPED X position of the node
 */
var x1, y1, node, cw, dis1, dis2, xx, wrap_x;
x1 = argument0;
y1 = argument1;
node = argument2;
//Get 1st distance (without wrapping)
dis1 = point_distance(x1, y1, node.x, node.y);
//Check which direction to wrap
if (node.x < room_width/2)
{
    xx = node.x+room_width;
}
else
{
    xx = node.x-room_width;
}
//Get 2nd distance (with wrapping)
dis2 = point_distance(x1, y1, xx, node.y);
//If 2nd distance is shorter than 1st distance, then we want to wrap
wrap_x = (dis2 < dis1);
//Return the result
if (wrap_x)
{
    return xx;
}
else
{
    return node.x;
}




