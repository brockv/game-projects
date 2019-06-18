/// @description Draw node & connections
if (global.test_mode)
{
    draw_self();
    if (mouse_over())
    {
        var size = ds_map_size(connections);
        var count = 0;
        for (var node = ds_map_find_first(connections);
             count < size;
             node = ds_map_find_next(connections, node))
        {
            var xx = get_node_x(x, y, node);
            draw_line_width(x, y, xx, node.y, 1);
            if (xx != node.x)
            {
                if (x < room_width/2)
                {
                    draw_line_width(x+room_width, y, node.x, node.y, 1);
                }
                else
                {
                    draw_line_width(x-room_width, y, node.x, node.y, 1);
                }
            }
            count++;
        }
    }
}


