/// @description pathfinder_step()
/*
 * Should be called in the End Step event for any Entity which
 * needs to use pathfinding
 */
var point, block_side, a, v, dir, clinging, point_correct, moving_correct, angle_correct;
///Move toward first point on path
if (ds_list_size(path) > 0)
{
    //Get the first point in the list
    point = path[|0];
    //Check if we need to jump
    if (ground && !cling_left && !cling_right)
    {
        block_side = check_collision(hsp*2, 1);
        if (!block_side && !check_collision(hsp*2, -8))
        {
            if (point.y < bbox_bottom)
            {
                v = 1-(point.y-(bbox_bottom+bbox_top)/2)/48;
                move_jump = clamp(v, 0.5, 1);
            }
        }
    }
    //Move towards point in x direction
    a = 4; //threshold for stopping when close enough to the node
    if (get_node_x(x, y, point) > x+a)
    {
        if (old_move_x < 0)
        {
            move_x = 0;
            change_direction = 0;
        }
        else
        if (old_move_x == 0)
        {
            if (change_direction++ > change_direction_max+reaction_time)
            {
                move_x = 1;
            }
        }
        else
        if (point.y < bbox_top || point.y > bbox_bottom)
        {
            v = (point.x-x)/16;
            move_x = clamp(v, 0.3, 1);
        }
        else
        {
            move_x = 1;
        }
        facing = 1;
    }
    else
    if (get_node_x(x, y, point) < x-a)
    {
        if (old_move_x > 0)
        {
            move_x = 0;
            change_direction = 0;
        }
        else
        if (old_move_x == 0)
        {
            if (change_direction++ > change_direction_max+reaction_time)
            {
                move_x = -1;
            }
        }
        else
        if (point.y < bbox_top || point.y > bbox_bottom)
        {
            v = (point.x-x)/16;
            move_x = clamp(v, -1, -0.3);
        }
        else
        {
            move_x = -1;
        }
        facing = -1;
    }
    else
    {
        move_x = 0;
    }
    //Check if we wanna jump
    jump_timer += ground; //add to jump timer while on the ground (ground is boolean)
    if (jump_timer > jump_timer_max+reaction_time || cling_left || cling_right)
    if (point.y < bbox_top-global.grid_size/2)
    {
        dir = point_direction((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, point.x, point.y);
        a = 20;
        clinging        = (cling_left || cling_right); //entity clinging to a wall?
        point_correct   = (x > point.x-16 && x < point.x+16); //target point in a good position?
        moving_correct  = (point.x > x && hsp > 1) || (point.x < x && hsp < -1); //entity moving in the right direction?
        angle_correct   = (dir > a && dir < 180-a); //angle to target point between 20 & 160 degrees?
        if (clinging || ((point_correct || moving_correct) && angle_correct))
        {
            v = point_distance((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, point.x, point.y)/32;
            move_jump = clamp(v, 0.75, 1);
            jump_timer = 0;
        }
    }
    //Check if we wanna fall through
    fallthrough = false;
    if (point.y > bbox_bottom)
    {
        if (fallthrough_timer++ > fallthrough_timer_max+reaction_time)
        if (place_meeting(x, y+1, o_semi_solid_parent))
        {
            fallthrough = true;
        }
    }
    //Check if we've hit the point
    if (collision_line(x, bbox_top+8, x, bbox_bottom, point, false, true))
    {
        if (ground || point.type == node_type.wall)
        {
            ds_list_delete(path, 0);
            update_path = update_path_max;
        }
    }
    //Check for grabbing a ledge
    if (state == state.ledge_grab)
    {
        if (point.y < bbox_top)
        {
            move_jump = 1; //jump up the ledge
        }
        else
        {
            fallthrough = true; //fall down off the ledge
        }
    }
}
else
{
    move_x = 0;
}
if (random(100) < 5)
{
    reaction_time = random(reaction_time_max);
}
//Update path
if ((ground || cling_left || cling_right) && (update_path-- < 0))
{
    update_path = update_path_max;
    get_path(x+hsp*2, (bbox_top+bbox_bottom)/2, target_x, target_y);
}





