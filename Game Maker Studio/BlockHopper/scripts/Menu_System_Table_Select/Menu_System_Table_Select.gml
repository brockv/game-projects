//Handles Menu Options
switch  (mpos)
{
    //EASY SCORES
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.difficulty_path = "Easy";
        //Open "scores_easy.ini"
        ini_open("scores_easy.ini")
        for (i = 0; i < 5; i++)
        {
            //Fill Scores Array With Values From The Ini File. If No Values, Fill With Name = "Unknown", Time = "99999", And Attempts = "500"
            global.score_array[i, 0] = ini_read_string(string(i), "Name", "Unknown");
            global.score_array[i, 1] = ini_read_real(string(i), "Time", 99999);
            global.score_array[i, 2] = ini_read_real(string(i), "Attempts", 500);
        }
        //Close ini File
        ini_close();
        global.next_room = room_Table_Display;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Table_Display);
        break;
    }
    //MEDIUM SCORES
    case 2:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.difficulty_path = "Medium";
        //Open "scores_medium.ini"
        ini_open("scores_medium.ini")
        for (i = 0; i < 5; i++)
        {
            //Fill Scores Array With Values From The Ini File. If No Values, Fill With Name = "Unknown", Time = "99999", And Attempts = "500"
            global.score_array[i, 0] = ini_read_string(string(i), "Name", "Unknown");
            global.score_array[i, 1] = ini_read_real(string(i), "Time", 99999);
            global.score_array[i, 2] = ini_read_real(string(i), "Attempts", 500);
        }
        //Close ini File
        ini_close();
        global.next_room = room_Table_Display;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Table_Display);
        break;
    }
    //HARD SCORES
    case 3:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.difficulty_path = "Hard";
        //Open "scores_hard.ini"
        ini_open("scores_hard.ini")
        for (i = 0; i < 5; i++)
        {
            //Fill The Scores Array With Values From The Ini File. If No Values, Fill With Name = "Unknown", Time = "99999", And Attempts = "500"
            global.score_array[i, 0] = ini_read_string(string(i), "Name", "Unknown");
            global.score_array[i, 1] = ini_read_real(string(i), "Time", 99999);
            global.score_array[i, 2] = ini_read_real(string(i), "Attempts", 500);
        }
        //Close ini File
        ini_close();
        global.next_room = room_Table_Display;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Table_Display);
        break;
    }
    //MAIN MENU
    case 4:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Start_Menu;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Start_Menu);
        break;
    }
    default: break;
}
