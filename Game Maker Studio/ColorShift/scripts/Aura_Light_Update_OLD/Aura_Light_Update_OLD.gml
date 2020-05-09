/// @description  Aura_Light_Update(vertex_format, vertex_buffer);
/// @param vertex_format
/// @param  vertex_buffer

/////////////////////////////////////////////////////////////////////////////////////

// This script is the OLD version of the update script. The new version greatly 
// reduces vertex batches, so should be faster and better especially on mobile.
// If you have any issues, simply delete the other version of the script and rename
// this one to omit the "_OLD" from the end and everything should work as before

//////////////////////////////////////////////////////////////////////////////////////

// This script should only be called from the main Aura_Update() script.
// Here all the main drawing for each light is done. It also uses two extra 
// sub scripts to check for collisions and to check the light is in the view.

// Set up the variables
var a_vf = argument0;
var a_sb = argument1;

var a_tx, a_ty, i, a_dir, a_inst, a_rad, a_ox, a_oy;

// Update the lights
with (obj_Aura_Light_Parent)
{
if aura_light_enabled
    {
    // Check the light surface exists
    if !surface_exists(aura_light_surface)
        {
        Aura_Light_ReInit();
        }
    else
        {
        // Check if it is to be updated and is in the view
        if aura_light_update && in_view()
            {
            // Set surface
            surface_set_target(aura_light_surface);
            
            // Draw the light sprite
            draw_sprite_ext(sprite_index, image_index, aura_light_radius, aura_light_radius, image_xscale, image_yscale, image_angle, c_white, 1);
            
            //making a temp object variable for the with loop.
            a_inst = id;
            a_rad = aura_light_radius;
            a_ox = x;
            a_oy = y;
            
            //loop through all shadow casters, creating a vertex buffer for each
            with(obj_Aura_ShadowCaster_Parent)
                {
                if in_light(a_inst)
                    {
                    // Loop through the shadow caster vertices and add them to the vertex buffer
                    vertex_begin(a_sb, a_vf);            
                    for(i = 0; i < aura_shadow_points; i++;)
                        {
                        a_tx = x + aura_shadow_x[i] - a_ox + a_rad;
                        a_ty = y + aura_shadow_y[i] - a_oy + a_rad;                
                        a_dir = point_direction(a_tx, a_ty, a_rad, a_rad) + 180;               
                        vertex_position(a_sb, a_tx,a_ty);
                        vertex_colour(a_sb, c_black, 1);                
                        vertex_position(a_sb, a_tx + lengthdir_x(a_rad * 8, a_dir), a_ty + lengthdir_y(a_rad * 8, a_dir));
                        vertex_colour(a_sb, c_black, 1);
                        }
                    a_tx = x + aura_shadow_x[0] - a_ox + a_rad;
                    a_ty = y + aura_shadow_y[0] - a_oy + a_rad;
                    a_dir = point_direction(a_tx, a_ty, a_rad, a_rad) + 180;
                    vertex_position(a_sb, a_tx,a_ty);
                    vertex_colour(a_sb, c_black, 1);
                    vertex_position(a_sb, a_tx + lengthdir_x(a_rad * 8, a_dir), a_ty + lengthdir_y(a_rad * 8, a_dir));
                    vertex_colour(a_sb, c_black, 1);
                    vertex_end(a_sb);
                    // Submit the vertex buffer for drawing
                    vertex_submit(a_sb, pr_trianglestrip, -1);
                    }
                }
            surface_reset_target();
            // Check to see if static
            if aura_light_static
                {
                aura_light_update = false;
                }
            }
        }
    }
}
