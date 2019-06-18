/// @description create_node(x, y, [type])
/// @param x
/// @param  y
/// @param  [type]
/*
 * Create a node object at a given position with an optional
 * node type. Default is normal.
 */
var node = instance_create_layer(argument[0], argument[1], "enemy", o_node);
if (argument_count > 2)
{
    node.type = argument[2];
}


