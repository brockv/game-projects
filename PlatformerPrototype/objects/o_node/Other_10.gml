/// @description Connect to nearby nodes
var node, xx, yy, i, a, v, h, block_above, block_left, block_right;
a = global.grid_size;
v = global.nodes_connect_v;
h = global.nodes_connect_h;
block_above = place_meeting(x, y-a, o_collision_parent);
block_left = place_meeting(x-a, y, o_collision_parent);
block_right = place_meeting(x+a, y, o_collision_parent);
///Connect left
xx = x-a;
repeat(global.nodes_connect_h)
{
    //Wrap xx around room
    if (global.room_wrap)
    if (xx < 0)
    {
        xx += room_width;
    }
    //Check for node
    node = instance_place(xx, y, o_node);
    if (node != noone && node.type != node_type.wall)
    {
        node_connect(node);
        break;
    }
    //Above
    if (!block_above)
    for (yy = y-a; yy >= y-a*v; yy -= a)
    {
        node = instance_place(xx, yy, o_node);
        if (node != noone)
        if (line_of_sight(x, y, node.x, node.y, 4))
        {
            node_connect(node);
        }
    }
    //Below
    if (!block_left)
    for (yy = y+a; yy <= y+a*v; yy += a)
    {
        if (place_meeting(xx, yy, o_collision_parent)) break;
        node = instance_place(xx, yy, o_node);
        if (node != noone && node.type != node_type.wall)
        {
            if (!place_meeting(xx, yy-a, o_collision_parent))
            {
                node_connect(node);
            }
        }
    }
    if (place_meeting(xx, y, o_collision_parent)) break;
    xx -= a;
}
///Connect right
xx = x+a;
repeat(global.nodes_connect_h)
{
    //Wrap xx around room
    if (global.room_wrap)
    if (xx > room_width)
    {
        xx -= room_width;
    }
    //Check for node
    node = instance_place(xx, y, o_node);
    if (node != noone && node.type != node_type.wall)
    {
        node_connect(node);
        break;
    }
    //Above
    if (!block_above)
    for (yy = y-a; yy >= y-a*v; yy -= a)
    {
        node = instance_place(xx, yy, o_node);
        if (node != noone)
        if (line_of_sight(x, y, node.x, node.y, 4))
        {
            node_connect(node);
        }
    }
    //Below
    if (!block_right)
    for (yy = y+a; yy <= y+a*v; yy += a)
    {
        if (place_meeting(xx, yy, o_collision_parent)) break;
        node = instance_place(xx, yy, o_node);
        if (node != noone && node.type != node_type.wall)
        {
            if (!place_meeting(xx, yy-a, o_collision_parent))
            {
                node_connect(node);
            }
        }
    }
    if (place_meeting(xx, y, o_collision_parent)) break;
    xx += a;
}
///Connect to nodes below (if on top of a fallthrough node)
if (type == node_type.fallthrough)
{
    for (yy = y+a; yy < room_height; yy += a)
    {
        node = instance_place(x, yy, o_node);
        if (node != noone && node.type != node_type.wall)
        {
            node_connect(node);
            break;
        }
    }
}
if (type != node_type.wall)
{
    ///Connect below left & right
    for (xx = -v; xx <= v; xx++)
    {
        if (xx != 0)
        {
            cont = true;
            for (i = x; i != x+xx*a; i = approach(i, x+xx*a, a))
            {
                if (place_meeting(i, y, o_node) || place_meeting(i, y, o_collision_parent))
                {
                    cont = false;
                    break;
                }
            }
            if (cont)
            {
                for (yy = y; yy < room_height; yy += a)
                {
                    if (place_meeting(x+xx*a, yy, o_collision_parent)) break;
                    node = instance_place(x+xx*a, yy, o_node);
                    if (node != noone && node.type != node_type.wall)
                    {
                        node_connect(node);
                        break;
                    }
                }
            }
        }
    }
    ///Connect above
    for (yy = y-a; yy >= y-a*v; yy -= a)
    {
        if (place_meeting(x, yy, o_collision_parent)) break;
        node = instance_place(x, yy, o_node);
        if (node != noone)
        {
            node_connect(node);
            break;
        }
    }
    ///Connect above left & right
    for (yy = y-a; yy >= y-a*v; yy -= a)
    {
        if (place_meeting(x, yy, o_collision_parent) || place_meeting(x, yy, o_node))
        {
            break;
        }
        else
        {
            //Left
            for (xx = x-a; xx >= x-a*v; xx -= a)
            {
                if !(yy < y-a*v && xx == x-a)
                {
                    if (place_meeting(xx, yy, o_collision_parent)) break;
                    node = instance_place(xx, yy, o_node);
                    if (node != noone)
                    {
                        node_connect(node);
                        break;
                    }
                }
            }
            //Right
            for (xx = x+a; xx <= x+a*v; xx += a)
            {
                if !(yy < y-a*v && xx == x+a)
                {
                    if (place_meeting(xx, yy, o_collision_parent)) break;
                    node = instance_place(xx, yy, o_node);
                    if (node != noone)
                    {
                        node_connect(node);
                        break;
                    }
                }
            }
        }
    }
}
else
//Wall nodes connect DIRECTLY above ONLY
{
    yy = y-a;
    node = instance_place(x, yy, o_node);
    if (node != noone)
    {
        node_connect(node);
    }
}




