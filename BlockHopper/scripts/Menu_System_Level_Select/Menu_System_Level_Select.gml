//Handles Menu Options
switch  (mpos)
{
    //EASY LEVELS
    case 1:
    {
        audio_stop_all();
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.3, 0);
        global.seconds = 0;
        global.minutes = 0;
        global.hours = 0;
        global.count_up = true;
        global.game_start = true;
        global.difficulty_path = "Easy";
        global.next_room = room_Easy_One;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Easy_One);
        audio_play_sound(music_Easy, 80, true);
        audio_sound_gain(music_Easy, 0.4, 0);
        break;
    }
    //MEDIUM LEVELS
    case 2:
    {
        audio_stop_all();
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.seconds = 0;
        global.minutes = 0;
        global.hours = 0;
        global.count_up = true;
        global.game_start = true;
        global.difficulty_path = "Medium";
        global.next_room = room_Medium_One;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Medium_One);
        audio_play_sound(music_Medium, 80, true);
        audio_sound_gain(music_Medium, 0.4, 0);
        break;
    }
    //HARD LEVELS
    case 3:
    {
        audio_stop_all();
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.seconds = 0;
        global.minutes = 0;
        global.hours = 0;
        global.count_up = true;
        global.game_start = true;
        global.difficulty_path = "Hard";
        global.next_room = room_Hard_One;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        //room_goto(room_Hard_One);
        audio_play_sound(music_Hard, 80, true);
        audio_sound_gain(music_Hard, 0.4, 0);
        break;
    }
    //MAIN MENU
    case 4:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Start_Menu;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    default: break;
}
