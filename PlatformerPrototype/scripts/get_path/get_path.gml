/// @description get_path(x1, y1, x2, y2, [avoid_danger?])
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  [avoid_danger?]
/*
 * Get the shortest available path (list of nodes) between two points
 *
 * x1 - x position of start point
 * y1 - y position of start point
 * x2 - x position of target point
 * y2 - y position of target point
 * avoid_danger - (default true) whether or not the path should avoid danger zones
 */
var x1, y1, x2, y2, F, G, H,
    start_node, goal_node, current_node, previous_node,
    opened_list, closed_list, distances,
    connections, finish, last_connection, current_score,
    avoid_danger, cancel, neighbour;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
x1 += (x2 > x1)*global.grid_size/4+hsp; //add to the start position, so that
                                        //the entity starts moving in the correct
                                        //direction instead of going to the node
                                        //behind them first.
avoid_danger = true;
if (argument_count > 4)
{
    avoid_danger = argument[4];
}
else
{
    if (place_meeting(x, y, o_danger_zone))
    {
        avoid_danger = false;
    }
}
cancel = false;
start_node = instance_nearest(x1, y1, o_node); //find the node nearest to the start position
goal_node = instance_nearest(x2, y2, o_node); //find the node nearest to the end position

opened_list = ds_priority_create(); //Value: Node, Priority: Score
closed_list = ds_list_create();
previous_nodes = ds_map_create(); //Key: Node, Value: Previous Node
distances = ds_map_create(); //Key: Node, Value: Distance

current_node = noone;
ds_priority_add(opened_list, start_node, 1); //start at a score of 1
ds_map_add(distances, start_node, 0);

//Repeat until there are no items left in our node priority list
while (ds_priority_size(opened_list) > 0)
{
    //Get the first node in the priority list
    current_node = ds_priority_find_min(opened_list);
    
    //Break the loop if we've hit the goal node
    if (current_node == goal_node)
    {
        break;
    }
    
    ds_priority_delete_min(opened_list); //remove current node
    ds_list_add(closed_list, current_node); //add current node to closed list
    
    //get a map of connections from the current node
    connections = current_node.connections;
    finish = false;
    last_connection = ds_map_find_last(connections);
    //Loop through all node connections
    for (neighbour = ds_map_find_first(connections); !finish;
         neighbour = ds_map_find_next(connections, neighbour))
    {
        //If this is the last connection, set finish to true
        //so that this is the last time the loop will be executed
        if (neighbour == last_connection)
        {
            finish = true;
        }
        
        //if the neighbour node is already in the closed list, ignore it
        //and continue the loop
        if (ds_list_find_index(closed_list, neighbour) != -1)
        {
            continue;
        }
        
        //Check for any collisions with DANGER ZONES on this connection (90% chance of avoiding danger zone!)
        if (avoid_danger)
        if (collision_line(current_node.x, current_node.y, neighbour.x, neighbour.y, o_danger_zone, true, true))
        {
            continue;
        }
        
        //Calculate G value
        G = connections[? neighbour] + distances[? current_node];
        
        //Add or replace this G value to our map of distances
        if (!ds_map_exists(distances, neighbour))
        {
            ds_map_add(distances, neighbour, G);
        }
        else
        if (G < ds_map_find_value(distances, neighbour))
        {
            ds_map_replace(distances, neighbour, G);
        }
        
        //Get the current score from priority list
        //This is the current lowest distance between the start & current nodes
        current_score = ds_priority_find_priority(opened_list, neighbour); //will return 'undefined' if it doesn't exist
        
        H = 0; //heuristic is always 0 for the time being (all nodes cost the same value to pass through)
        //H = max(0, (current_node.y-neighbour.y)/*global.grid_size*5*/);
        F = G + H;
        
        //If the new F value is better (lower) than our current best score (current_score),
        //then we should start using the neighbour node, instead of the current one
        if (F < current_score || current_score == undefined)
        {
            //Add neighbour node to our priority list of scores
            if (current_score == undefined) //(if there is no current score)
            {
                ds_priority_add(opened_list, neighbour, F);
            }
            else
            {
                ds_priority_change_priority(opened_list, neighbour, F);
            }
            
            //Add neighbour node to our map of previous nodes
            if (!ds_map_exists(previous_nodes, neighbour))
            {
                ds_map_add(previous_nodes, neighbour, current_node);
            }
            else
            {
                ds_map_replace(previous_nodes, neighbour, current_node);
            }
        }
    }
}

//Clean up some lists, we're done with them now!
ds_priority_destroy(opened_list);
ds_list_destroy(closed_list);
ds_map_destroy(distances);

if (!cancel)
{
    //Clear path list, so that it can be populated again
    ds_list_clear(path);
    //Only get new path if we reached the goal node
    if (current_node == goal_node)
    {
        //If we DID reach the goal node, create a list of the nodes in the previous_nodes map
        var temp_path = ds_list_create();
        while (true)
        {
            //add a node to the list
            ds_list_add(temp_path, current_node);
            
            //if this node is the start node, reverse the path list & return it
            if (current_node == start_node)
            {
                ds_list_reverse(temp_path, path);
                ds_list_destroy(temp_path);
                break; //break the while loop
            }
            
            //Get the next node in the previous nodes map
            current_node = previous_nodes[? current_node];
        }
    }
    ds_map_destroy(previous_nodes);
}

