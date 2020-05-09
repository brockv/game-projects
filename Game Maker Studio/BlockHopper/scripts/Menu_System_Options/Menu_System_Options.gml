//Handles Menu Options
switch  (mpos)
{
    //CHANGE COLOR
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.current_color += 1;
        if (global.current_color > 6) { global.current_color = 0 }
        if (global.current_color = 0)
        {
            //DEFAULT
            obj_Player.sprite_index = spr_Run;
            global.player_color = 0;
        }
        else if (global.current_color = 1)
        {
            //PINK
            obj_Player.sprite_index = spr_Run_Pink;
            global.player_color += 1;
        }
        else if (global.current_color = 2)
        {
            //GREEN
            obj_Player.sprite_index = spr_Run_Green;
            global.player_color += 1;
        }
        else if (global.current_color = 3)
        {
            //RED
            obj_Player.sprite_index = spr_Run_Red;
            global.player_color += 1;
        }
        else if (global.current_color = 4)
        {
            //ORANGE
            obj_Player.sprite_index = spr_Run_Orange;
            global.player_color += 1;
        }
        else if (global.current_color = 5)
        {
            //GRAY
            obj_Player.sprite_index = spr_Run_Gray;
            global.player_color += 1;
        }
        else if (global.current_color = 6)
        {
            //GRAY
            obj_Player.sprite_index = spr_Run_Clear;
            global.player_color += 1;
        }
         
        break;
    }
    //VIEW CONTROLS
    case 2:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Controls;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    //RETURN TO MAIN MENU
    case 3:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.next_room = room_Start_Menu;
        instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
        break;
    }
    default: break;
}
