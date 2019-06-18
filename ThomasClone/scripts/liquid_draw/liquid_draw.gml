/// @description liquid_draw(id, col1, col2, alpha1, alpha2, blend)
/// @param id
/// @param  col1
/// @param  col2
/// @param  alpha1
/// @param  alpha2
/// @param  blend
/*
    Draws the liquid with custom colours, alphas and blend mode
    
    ARGUMENTS
        id - real - id of liquid object
        col1, col2 - real - top & bottom colours of the liquid
        alpha1, alpha2 - real - top & bottom alphas of the liquid
        blend - real - blend of the liquid
*/

    var i, nx, ny, by, p1, p2, p3, p4;
    
    //calculate the bottom y of the liquid
    by = argument0.y+argument0.liquidheight;
    
    //set liquid's blend mode
    draw_set_blend_mode(argument5);
    
    //find start and end nodes for drawing on-screen nodes only
    var pos1, pos2;
    pos1 = clamp(floor((__view_get( e__VW.XView, 0 )-argument0.x)/argument0.liquidnodewidth), 0, argument0.liquidnodes-1);
    pos2 = clamp(pos1+ceil((__view_get( e__VW.WView, 0 )-(argument0.x-__view_get( e__VW.XView, 0 )))/argument0.liquidnodewidth)+2, 0, argument0.liquidnodes-1);
    
    //ensure it is on-screen
    if !((pos1 >= (argument0.liquidnodes-1)) || (pos2 <= 0) || (argument0.y > (__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))) || (by < __view_get( e__VW.YView, 0 )))
    {
        //actually draw the liquid
        draw_primitive_begin(pr_trianglestrip);
    
        for(i = pos1; i <= pos2; i += 1) 
        {
            //calculate where the points to draw at are
            nx = argument0.x+i*argument0.liquidnodewidth;
            ny = argument0.liquidarray[i, 0]+argument0.liquidarray[i, 3];
            
            //draw points
            draw_vertex_color(nx, ny, argument1, argument3);
            draw_vertex_color(nx, by, argument2, argument4);
        }
        
        draw_primitive_end();
    }
    
    //reset blend mode
    draw_set_blend_mode(bm_normal);
    

// REMOVE THIS TO DISABLE DEBUG LINE DRAWING
//for (var i = 0; i < argument0.liquidnodes; ++i)
//    draw_line(argument0.x + (16 * i), argument0.liquidarray[i, 0], argument0.x + (16 * i), argument0.liquidarray[i, 0] - 8);
