/// @description liquid_set_width(id, w)
/// @param id
/// @param  w
/*
    Changes the width of the liquid
    
    ARGUMENTS
        id - real - id of liquid object
        w,  real - liquid's size
        
*/

    //set variables
    argument0.liquidwidth = argument1;
    argument0.liquidnodewidth = argument0.liquidwidth/argument0.liquidnodes;
    argument0.image_xscale = argument0.liquidwidth/sprite_get_width(argument0.sprite_index);
    argument0.image_yscale = argument0.liquidheight/sprite_get_height(argument0.sprite_height);
    
