//Handles High Score Menu Options
switch  (mpos)
{
    //RETURN TO TABLE SELECT
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Tables;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    default: break;
}
