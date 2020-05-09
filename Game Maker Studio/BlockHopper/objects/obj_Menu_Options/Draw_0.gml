/// @description Draws The Menu And Cursor

//Settings For Drawing The Menu
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_Difficulty);
draw_set_color(c_black);

//Draw Menu Items
var m;
for (m = 0; m < array_length_1d(menu); m += 1)
{
    if (m = 0) 
    {
        draw_text((room_width / 2), 46, string_hash_to_newline(string(menu[m])))
    }
    else
    {
        draw_set_font(font_Scores);
        draw_text((room_width / 2), 40 + (m * space), string_hash_to_newline(string(menu[m])))    
    }
}


//Draw And Animate Cursor
switch (mpos)
{
    case 1:
    {
        draw_sprite(sprite_index, next_frame, x, y + (mpos * space));
        break;    
    }
    case 2:
    {
        draw_sprite(sprite_index, next_frame, x + 25 , y + (mpos * space));
        break;
    }
    case 3:
    {
        draw_sprite(sprite_index, next_frame, x + 90 , y + (mpos * space));
        break;
    }
    default: break;

}

