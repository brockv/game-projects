/// @description Draws The Menu And Cursor

//Settings For Drawing The Menu
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_Difficulty);
draw_set_color(c_black);

//Draw The Menu Items
var m;
for (m = 0; m < array_length_1d(menu); m += 1)
{
    if (m = 1) draw_set_color(c_aqua);
    if (m = 2) draw_set_color(c_orange);
    if (m = 3) draw_set_color(c_red);
    if (m = 4) draw_set_color(c_black);
    draw_text((room_width / 2), 46 + (m * space), string_hash_to_newline(string(menu[m])))
}

//Draw And Animate The Cursor
switch (mpos)
{
    case 1:
    {
        draw_sprite(sprite_index, next_frame, x + 40, y + (mpos * space));
        break;
    }
    case 2:
    {
        draw_sprite(sprite_index, next_frame, x + 15, y + (mpos * space));
        break;
    }
    case 3:
    {
        draw_sprite(sprite_index, next_frame, x + 45, y + (mpos * space));
        break;
    }
    case 4:
    {
        draw_sprite(sprite_index, next_frame, x + 45, y + (mpos * space));
        break;
    }
    default: break;
}

