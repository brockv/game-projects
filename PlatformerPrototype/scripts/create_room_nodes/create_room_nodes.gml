/// @description create_room_nodes(grid_size, create_wall_nodes)
/// @param grid_size
/// @param  create_wall_nodes
/*
 * Loop through the room, creating nodes on all solid & semi-solid blocks.
 * This script does NOT create wall-jump nodes, they need to be added to the
 * room MANUALLY.
 */
var a = argument[0];
var create_wall_nodes = true;
if (argument_count > 1)
{
    create_wall_nodes = argument[1];
}
///Create nodes on all blocks & platforms
for (var i = 0; i < room_width; i += a)
for (var j = 0; j < room_height; j += a)
{
    if (collision_rectangle(i, j, i+a-1, j+a-1, o_collision_parent, 0, 1) == noone) //no solid blocks
    if (collision_rectangle(i, j, i+a-1, j+a-1, o_node, 0, 1) == noone) //no existings nodes
    if (collision_rectangle(i, j, i+a-1, j+a-1, o_no_node_zone, 0, 1) == noone) //no no-node zones
    {
        if (collision_point(i, j+a, o_collision_parent, 0, 1) != noone) //solid block below
        {
            create_node(i+a/2, j+a/2);
        }
        else
        if (collision_point(i, j+a, o_semi_solid_parent, 0, 1) != noone) //semi-solid block below
        {
            //give this node a fallthrough type so that it connects to nodes
            //below this platform
            create_node(i+a/2, j+a/2, node_type.fallthrough);
        }
        else
        if (create_wall_nodes)
        if (collision_point(i, j-a, o_collision_parent, 0, 1) == noone) 
        if (collision_point(i-a, j, o_collision_parent, 0, 1) != noone || //solid block left
            collision_point(i+a, j, o_collision_parent, 0, 1) != noone) //solid block right
        {
            create_node(i+a/2, j+a/2, node_type.wall);
        }
    }
}


