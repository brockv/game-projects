//Handles Game Over Menu Options
switch  (mpos)
{
    //RESTART GAME
    case 0:
    {
        audio_stop_all();
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        game_restart();
        break;
    }
    //SUBMIT TIME
    case 1:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.submit_name = get_string_async("Enter your name:", "AAA");
        break;    
    }
    //QUIT GAME
    case 2:
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        game_end();
        break;
    }
    default: break;
}
