/// @description liquid_draw_surface(id, surfaceimg, offset, height, col1, col2, alpha1, alpha2, blend)
/// @param id
/// @param  surfaceimg
/// @param  offset
/// @param  height
/// @param  col1
/// @param  col2
/// @param  alpha1
/// @param  alpha2
/// @param  blend
/*
    Draws the liquid surface with an image centered on the liquid's waves
    
    ARGUMENTS
        id - real - id of liquid object
        surfaceimg - resorce - sprite to stretch across the top of liquid
        offset - real - y offset of the liquid's waves to the top of the surface strip
        height - real - height of the surface (to stretch to)
        colour1/colour2 - real - top & bottom colours of the surface
        alpha1/alpha2 - real - top & bottom alphas of the surface
        blend - real - blend of the surface
*/

    //liquid's surface variables
    var xt, nx, ny;
    
    //set surface's blend mode
    draw_set_blend_mode(argument8);
    
    //find start and end nodes for drawing on-screen nodes only
    var pos1, pos2;
    pos1 = clamp(floor((__view_get( e__VW.XView, 0 )-argument0.x)/argument0.liquidnodewidth), 0, argument0.liquidnodes-1);
    pos2 = clamp(pos1+ceil((__view_get( e__VW.WView, 0 )-(argument0.x-__view_get( e__VW.XView, 0 )))/argument0.liquidnodewidth)+2, 0, argument0.liquidnodes-1);
    
    //ensure it is on-screen
    if !((pos1 >= (argument0.liquidnodes-1)) || (pos2 <= 0) || (argument0.y > (__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))) || ((argument0.y+argument0.liquidheight) < __view_get( e__VW.YView, 0 )))
    {
        //actually draw the surface
        draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument1, 0));
    
        for(i = pos1; i <= pos2; i += 1) 
        {
            //calculate where the points to draw at are
            nx = argument0.x+i*argument0.liquidnodewidth;
            ny = argument0.liquidarray[i, 0]+argument0.liquidarray[i, 3];
            
            //draw points
            xt = (i-1)/argument0.liquidnodes;
            draw_vertex_texture_colour(nx, ny+argument2, xt, 0, argument4, argument6);
            draw_vertex_texture_colour(nx, (ny+argument2)+argument3, xt, 1, argument5, argument7);
        }
        
        draw_primitive_end();
    }
    
    //reset blend mode
    draw_set_blend_mode(bm_normal)
