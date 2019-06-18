/// @description liquid_draw_texture(id, spr, img, colour1, colour2, alpha1, alpha2, blend)
/// @param id
/// @param  spr
/// @param  img
/// @param  colour1
/// @param  colour2
/// @param  alpha1
/// @param  alpha2
/// @param  blend
/*
    Draws the liquid with a texture and colour blend, alpha and alpha blend
    
    ARGUMENTS
        id - real - id of liquid object
        spr - real - texture to stretcha cross the liquid's body
        colour1/colour2 - real - top & bottom colours of the liquid
        alpha1/alpha2 - real - top & bottom alphas of the liquid
        blend - real - blend of the liquid
*/

    //set repeating textures
    texture_set_repeat(true);
    
    var i, nx, ny, by, xt, sprscale, lhscale;
    
    //calculate the bottom y of the liquid
    by = argument0.y+argument0.liquidheight;
    
    //scale the tex
    sprscale = argument0.liquidheight/sprite_get_height(argument1);
    lhscale = argument0.liquidwidth/(sprite_get_width(argument1)) / 2//*sprscale);
    
    //set liquid's blend mode
    draw_set_blend_mode(argument7);
    
    //find start and end nodes for drawing on-screen nodes only
    var pos1, pos2;
    pos1 = clamp(floor((__view_get( e__VW.XView, 0 )-argument0.x)/argument0.liquidnodewidth), 0, argument0.liquidnodes-1);
    pos2 = clamp(pos1+ceil((__view_get( e__VW.WView, 0 )-(argument0.x-__view_get( e__VW.XView, 0 )))/argument0.liquidnodewidth)+2, 0, argument0.liquidnodes-1);
    
    //ensure it is on-screen
    if !((pos1 >= (argument0.liquidnodes-1)) || (pos2 <= 0) || (argument0.y > (__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))) || (by < __view_get( e__VW.YView, 0 )))
    {
        //actually draw the liquid
        draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument1, argument2));
        
        for(i = 0; i < argument0.liquidnodes; i += 1) 
        {
            //calculate where the points to draw at are
            nx = argument0.x+i*argument0.liquidnodewidth;
            ny = argument0.liquidarray[i, 0]+argument0.liquidarray[i, 3];
            
            //draw points
            xt = ((i/(argument0.liquidnodes+1))*lhscale);
            draw_vertex_texture_colour(nx, ny, xt, 0, argument3, argument5);
            draw_vertex_texture_colour(nx, by, xt, 1, argument4, argument6);
        }
        
        draw_primitive_end();
    }
    
    //reset blend mode
    draw_set_blend_mode(bm_normal);
