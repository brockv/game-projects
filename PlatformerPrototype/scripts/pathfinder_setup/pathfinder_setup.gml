/// @description pathfinder_setup(update_timer, reaction_time)
/// @param update_timer
/// @param  reaction_time
/*
 * Set up an entity for pathfinding.
 * Should be called in the create event of any entity which will
 * use the pathfinding system.
 *
 * update_timer - the number of steps between finding paths to targets
 * reaction_time - the time taken to think about doing stuff (jump, change direction, etc)
 */
path = ds_list_create(); //ds_list of nodes to get to destination node
update_path = argument0;
update_path_max = argument0;
target_x = 0; //the x and y position we want to find a path to
target_y = 0;
change_direction = 0; //time taken before changing direction
change_direction_max = 0;
jump_timer = 0; //time taken before jumping
jump_timer_max = 10;
fallthrough_timer = 0; //time taken before falling through a platform
fallthrough_timer_max = 0;
reaction_time = argument1; //additional time to react to everything
reaction_time_max = argument1;



