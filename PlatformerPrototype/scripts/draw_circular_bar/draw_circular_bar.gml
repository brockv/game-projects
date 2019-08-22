///@description draw_circular_bar(x, y, value, max, colour, radius_, transparency, width)
///@param x
///@param y
///@param value
///@param max
///@param colour
///@param radius_
///@param transparency
///@param width

if (argument[2] > 0) { // no point even running if there is nothing to display (also stops /0
    var _i, _len, _tx, _ty, _val;
    
    var _num_sections = 60 // there is no draw_get_circle_precision() else I would use that here
    var _section_size = 360 / _num_sections
    
    _val = (argument[2] / argument[3]) * _num_sections 
    
    if (_val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
        pie_surface_ = surface_create(argument[5] * 2, argument[5] * 2)
            
        draw_set_colour(argument[4]);
        draw_set_alpha(argument[6]);
        
        surface_set_target(pie_surface_)
        
        draw_clear_alpha(c_blue, 0.7)
        draw_clear_alpha(c_black, 0)
        
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(argument[5], argument[5]);
        
        for (_i = 0; _i <= _val; _i++) {
            _len = (_i * _section_size) + 90; // the 90 here is the starting angle
            _tx = lengthdir_x(argument[5], _len);
            _ty = lengthdir_y(argument[5], _len);
            draw_vertex(argument[5] + _tx, argument[5] + _ty);
        }
        
        draw_primitive_end();
        
        draw_set_alpha(1);
        
        gpu_set_blendmode(bm_subtract)
        draw_set_colour(c_black)
        draw_circle(argument[5] - 1, argument[5] - 1, argument[5] - argument[7], false)
        gpu_set_blendmode(bm_normal)

        surface_reset_target()
     
        draw_surface(pie_surface_,argument[0] - argument[5], argument[1] - argument[5])
        
        surface_free(pie_surface_)
        
    }
    
}