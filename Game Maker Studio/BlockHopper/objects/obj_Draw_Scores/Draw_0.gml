/// @description Draws The Score Tables

xx = x;
yy = 100;

draw_set_font(font_Scores);
draw_set_halign(fa_left);
draw_set_color(c_lime);

for (i = 0; i < 5; i++)
{
    draw_set_halign(fa_left);
    
    hours = (global.score_array[i, 1] div 3600);
    minutes = (global.score_array[i, 1] div 60) - (hours * 60);
    seconds = global.score_array[i, 1] mod 60;
    attempts = global.score_array[i, 2];
    player = global.score_array[i, 0];
    
    yy += 32;

    draw_seconds = seconds;
    
    draw_text(xx, yy, string_hash_to_newline(string(player)));
    
    if (seconds <= 10) && (minutes < 10)
    {
        draw_text(xx + 210, yy, string_hash_to_newline(string(hours) + ":0" + string(minutes) + ":0" + string(draw_seconds)));
    }
    else if (seconds >= 10) && (minutes >= 10)
    {
        draw_text(xx + 210, yy, string_hash_to_newline(string(hours) + ":" + string(minutes) + ":" + string(draw_seconds)));
    }
    else if (seconds < 10) && (minutes >= 10)
    {
        draw_text(xx + 210, yy, string_hash_to_newline(string(hours) + ":" + string(minutes) + ":0" + string(draw_seconds)));
    }
    else if (seconds >= 10) && (minutes < 10)
    {
        draw_text(xx + 210, yy, string_hash_to_newline(string(hours) + ":0" + string(minutes) + ":" + string(draw_seconds)));
    }
    
    draw_set_halign(fa_center);
    draw_text(xx + 475, yy, string_hash_to_newline(string(attempts)));
    
}

