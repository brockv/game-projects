/// @description connect_all_nodes()
/*
 * Prompt all of the nodes in the room to connect to other nearby nodes.
 */
with (o_node)
{
    //Clear all existing node connections
    ds_map_clear(connections);
    //Connect to nearby nodes
    event_user(0);
}
with (o_node)
{
    //Move wall jump nodes in to the correct position
    if (type == node_type.wall)
    {
        sprite_index = s_wall_jump_node;
        var a = sprite_width;
        if (place_meeting(x-a, y, o_collision_parent)) x -= a/2;
        if (place_meeting(x+a, y, o_collision_parent)) x += a/2;
    }
}



