/// @description Draws Attempt Counter

///Positioning For Attempts Counter

if (room = room_Score_Display) { instance_destroy() };

if (room = room_Game_Over)
{
    draw_set_font(font_Scores);
    x = display_get_gui_width() / 2;  //369;
    y = display_get_gui_height() / 2; //192;
}
else
{
    draw_set_font(font_Timer);
    x = (display_get_gui_width() / 2) - 15;  //354;
    y = 22;  //display_get_gui_height() - 362;
}

draw_set_color(c_lime);
draw_text(x, y, string_hash_to_newline("Attempts: " + string(global.attempt_number)));

