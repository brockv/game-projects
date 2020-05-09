/// @description Draws The Menu And Cursor

if (global.pause)
{
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(
    0,
    0,
    display_get_gui_width(),  //view_xview[0] + view_wview[0],
    display_get_gui_height(), //view_yview[0] + view_hview[0],
    0,
    );

    draw_set_color(c_white);
    draw_set_alpha(1);
    
    
    var m;
    for (m = 0; m < array_length_1d(menu); m += 1)
    {
        if (m = 0)
        {
            draw_set_font(font_Scores);
            draw_text(
            display_get_gui_width() / 2,
            80 + (m * space),
            string_hash_to_newline(string(menu[m])),
            );
            
        }
        else
        {
            draw_set_font(font_Text);
            draw_text(
            display_get_gui_width() / 2,
            y + (m * space),
            string_hash_to_newline(string(menu[m]))
            );
        }
    }
    
    draw_set_color(c_black);    
    switch (mpos)
    {
    case 1:
    {
        draw_sprite(spr_Arrow, next_frame, x - 108, y + (mpos * space) - 15);
        break;
    }
    case 2:
    {
        draw_sprite(spr_Arrow, next_frame, x - 104, y + (mpos * space) - 15);
        break;
    }
    case 3:
    {
        draw_sprite(spr_Arrow, next_frame, x - 88, y + (mpos * space) - 15);
        break;
    }
    }
}

