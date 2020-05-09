/// @description Draws The Menu And Cursor

//Settings For Drawing The Menu
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_Text);
draw_set_color(c_black);

//Draw The Menu Items
var m;
for (m = 0; m < array_length_1d(menu); m += 1)
{
    draw_text((room_width / 2), 266 + (m * space), string_hash_to_newline(string(menu[m])))
}

//Draw And Animate The Cursor
switch (mpos)
{
    case 0:
    {
        draw_sprite(sprite_index, next_frame, x, y + (mpos * space));
        break;
    }
    case 1:
    {
        draw_sprite(sprite_index, next_frame, x + 10, y + (mpos * space));
        break;
    }
    case 2:
    {
        draw_sprite(sprite_index, next_frame, x + 20, y + (mpos * space));
        break;
    }
    default: break;
}

