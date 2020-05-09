/// @description Draws The Timer

///Runs The Timer

if (room = room_Score_Display) { instance_destroy() };

if (room = room_Game_Over)
{
    global.count_up = false;
    draw_set_font(font_Scores);
    x = (display_get_gui_width() / 2) + 6;   //375;
    y = (display_get_gui_height() / 2) - 32; //160;
}
else
{
    draw_set_font(font_Timer);
    x = (display_get_gui_width() / 2) - 9;  //360;
    y = 6; //display_get_gui_height() - 378;
    
}

if (global.count_up == true)
{
    global.seconds += 1/room_speed;
}

if (global.seconds < 60) && (global.seconds > 59.9)
{
    global.seconds = 0;
    global.minutes += 1;
}

if (global.minutes == 60)
{
    global.minutes = 0;
    global.hours += 1;
}

draw_set_color(c_lime);

if (global.seconds < 10) && (global.minutes < 10)
{
    draw_text(x, y, string_hash_to_newline(string(global.hours) + ":0" + string(global.minutes) + ":0" + string(global.seconds)));
}
else if (global.seconds >= 10) && (global.minutes >= 10)
{
    draw_text(x, y, string_hash_to_newline(string(global.hours) + ":" + string(global.minutes) + ":" + string(global.seconds)));
}
else if (global.seconds < 10) && (global.minutes >= 10)
{
        draw_text(x, y, string_hash_to_newline(string(global.hours) + ":" + string(global.minutes) + ":0" + string(global.seconds)));
}
else if (global.seconds >= 10) && (global.minutes < 10)
{
        draw_text(x, y, string_hash_to_newline(string(global.hours) + ":0" + string(global.minutes) + ":" + string(global.seconds)));
}

