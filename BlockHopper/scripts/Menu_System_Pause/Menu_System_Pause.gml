//Handles Pause Menu Options
switch  (mpos)
{
    //RESUME GAME
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        global.pause = 0;
        global.count_up = true;
        break;
    }
    //EXIT TO MENU
    case 2:
    {
        audio_play_sound(sound_Selection, 1, 0);
        game_restart();
        break;
    }
    //QUIT GAME
    case 3:
    {
        game_end();
    }
    default: break;
}
