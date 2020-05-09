/// @description liquid_set_nodes(id, nodes)
/// @param id
/// @param  nodes
/*
    Changes the amount of nodes in the liquid, unaffecting the size
    
    ARGUMENTS
        id - real - id of liquid object
        nodes - real - amount of moveable points on the liquid surface
        
*/

    //set variables
    argument0.liquidnodes = max(2, floor(argument1));
    argument0.liquidnodewidth = argument0.liquidwidth/(argument0.liquidnodes-1);
    liquid_buildnodes(argument0);
