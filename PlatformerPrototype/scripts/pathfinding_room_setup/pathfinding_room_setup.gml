/// @description pathfinding_room_setup(grid_size, can_wrap, wall_nodes, [connect_horizontal], [connect_vertical])
/// @param grid_size
/// @param  can_wrap
/// @param  wall_nodes
/// @param  [connect_horizontal]
/// @param  [connect_vertical]
/* 
 * Set up the room for pathfinding. Generates nodes in the room & automatically connects them.
 * Must be called at the start of every room which you want to use pathfinding.
 * 
 * grid_size - The size of the level blocks, spacing between the pathfinding nodes
 * can_wrap (boolean) - Should nodes connect to the other side of the room?
 * wall_nodes (boolean) - Automatically generate pathfinding nodes on the walls as well as ground?
 * connect_horizontal - (default 5) the total distance horizontally (in grid cells) that nodes can connect
 * connect_vertical - (default 2) the number of grid cells that entities can jump up
 *
 * connect_horizontal & connect_vertical should be adjusted depending on how high/far
 * you need your entities to be able to jump.
 */
global.grid_size = argument[0];
global.room_wrap = argument[1];
global.nodes_connect_h = 5; //default values 5 & 2
global.nodes_connect_v = 2;
if (argument_count > 3)
{
    global.nodes_connect_h = argument[3];
}
if (argument_count > 4)
{
    global.nodes_connect_v = argument[4];
}
create_room_nodes(global.grid_size, argument[2]);
connect_all_nodes();


