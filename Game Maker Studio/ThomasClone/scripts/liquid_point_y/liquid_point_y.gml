/// @description liquid_point_y(id, x)
/// @param id
/// @param  x
/*
    Returns the y of the nearest node of water at x
    
    ARGUMENTS
        id - real - the liquid id
        x - real - the x in the room (not relative) to check the y position
    
    RETURNS
        y - real - the y in the room that the nearest node lies
*/

    //find the enarest node to the x
    var node;
    node = clamp(floor((argument1-argument0.x)/argument0.liquidnodewidth), 0, argument0.liquidnodes-1);
    
    //return the y
    return argument0.liquidarray[node, 0];
