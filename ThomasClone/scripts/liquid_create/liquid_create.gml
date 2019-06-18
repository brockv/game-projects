/// @description liquid_create(x, y, w, h, nodes, spring, friction, factor, wave, waveamount, wavespeed, sides)
/// @param x
/// @param  y
/// @param  w
/// @param  h
/// @param  nodes
/// @param  spring
/// @param  friction
/// @param  factor
/// @param  wave
/// @param  waveamount
/// @param  wavespeed
/// @param  sides
/*
    Creates a functional liquid object with custom attributes.
    
    ARGUMENTS
        x, y - real - liquid's top left corner
        w, h - real - liquid's size
        nodes - real - amount of moveable points on the liquid surface (more = higher detail/slower)
        spring - real - higher numbers will make the liquid act slower
        friction - real - higher numbers will yeild a thicker liquid
        factor - real - the 'size' of the dynamics, smaller numbers for smaller waves
        wave - boolean - whether the liquid will wobble at the surface
        waveamount - real - amount in pixels waves can bob from the surface
        wavespeed - real - 1-180 lower numer yeilds a slower speed - use low numbers for realistic results
        sides - boolean - whether the sides move or not
        
    RETURNS
        id - real - id of liquid object
*/

    //set liquid variables
    var lid;
    lid = instance_create(argument0, argument1, oWater);
    lid.liquidwidth = argument2;
    lid.liquidheight = argument3;
    lid.image_xscale = lid.liquidwidth/sprite_get_width(lid.sprite_index);
    lid.image_yscale = lid.liquidheight/sprite_get_height(lid.sprite_index);
    lid.liquidnodes = max(2, floor(argument4));
    lid.liquidnodewidth = lid.liquidwidth/(lid.liquidnodes-1);
    lid.liquidspring = argument5;
    lid.liquidfriction = argument6;
    lid.liquidfactor = (argument7*60);
    lid.liquidwave = argument8;
    lid.liquidwaveamount = argument9;
    lid.liquidwavespeed = clamp(argument10, 1, 180);
    lid.liquidwaveangle = 0;
    lid.liquidsides = argument11;
    
    //build liquid array
    liquid_buildnodes(lid);
    
    //return liquid handle
    return lid;
