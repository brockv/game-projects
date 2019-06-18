/// @description pathfinder_draw_path()
/*
 * Draw the pathfinder's path (for testing purposes)
 */
if (path != noone)
{
    var size = ds_list_size(path);
    if (size > 0)
    {
        draw_set_alpha(0.3);
        var previous_x = mid_x();
        var previous_y = mid_y();
        for (var i = 0; i < size; i++)
        {
            var node = path[|i];
            if (i == 1) draw_set_colour(c_red);
            var nodex = get_node_x(previous_x, previous_y, node);
            draw_line_width(previous_x, previous_y, nodex, node.y, 1);
            if (nodex != node.x)
            {
                if (x < room_width/2)
                {
                    draw_line_width(previous_x+room_width, previous_y, node.x, node.y, 1);
                }
                else
                {
                    draw_line_width(previous_x-room_width, previous_y, node.x, node.y, 1);
                }
            }
            previous_x = node.x;
            previous_y = node.y;
        }
        draw_line_width(previous_x, previous_y, target_x, target_y, 1);
        draw_set_colour(c_white);
        draw_set_alpha(1);
    }
}

