//Handles Menu Options
switch  (mpos)
{
    //LEVEL SELECT
    case 0:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Level_Select;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    //HIGH SCORES
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Tables;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    //OPTIONS
    case 2:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Options;
        //global.next_room = room_Editor;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    //QUIT GAME
    case 3:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        game_end();
        break;
    }
    default: break;
}
