/// @description Pause Controls

//Don't Allow Pausing If Dead
if !instance_exists(obj_Player) exit;
//Remove Pause Controller On Game Over Screens
if (room = room_Game_Over) instance_destroy();


x = (display_get_gui_width() / 2) - 9;
y = (display_get_gui_height() / 2) - 50;

var key_pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_backspace);

if (key_pause) or (os_is_paused() == true)
{
    if (global.pause == 0)
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.pause = 1;
        global.count_up = false;
    }
    else
    {
        audio_play_sound(sound_Selection, 1, 0);
        audio_sound_gain(sound_Selection, 0.4, 0);
        global.pause = 0;
        global.count_up = true;
    }
}

if (global.pause)
{
    //Controls Cursor On Menu Items
    var move = 0;
    var key_up = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu);
    var key_down = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd);
    var key_accept = keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face1);
    
    //Swipe Detection
    if (mouse_check_button_pressed(mb_left)) && (can_press = true)
    {
        my = mouse_y;
        can_press = false;
        pressed = true;
    }

    var ty = mouse_y - my;

    //Swipe Up And Down
    if (abs(ty) > swipe_min) && (pressed = true)
    {
        if sign(ty) == -1
        {
            key_up = 1;
            pressed = false;
            alarm[0] = 5;
            alarm[1] = 10;
        }
        else
        {
            key_down = 1;
            pressed = false;
            alarm[0] = 5;
            alarm[1] = 10;
        }
    }

    if (mouse_check_button_pressed(mb_right)) && (!alarm[1])
    {
        key_accept = 1;
    }
    
    //Moves Cursor Up
    move -= max(key_up, 0);

    //Moves Cursor Down
    move += max(key_down, 0);

    //Play Sound On Cursor Move
    if (key_up) or (key_down)
    { 
        audio_play_sound(sound_Cursor, 0, 0)
        audio_sound_gain(sound_Cursor, 0.4, 0);    
    }
    
    //Keeps The Cursor On The Selections
    if (move != 0)
    {
        mpos+= move;
        //If Cursor Passes The Top Of The Menu, Go To The Bottom
        if (mpos < 1) mpos = array_length_1d(menu) - 1;
        //If The Cursor Passes The Bottom Of The Menu, Go To The Top
        if (mpos > array_length_1d(menu) - 1) mpos = 1;
    }

    var key_push;
    //Checks For Key Presses
    key_push = max(key_accept, 0);
    //If Enter Or Start Are Pressed, Go To Appropriate Room
    if (key_push == 1) Menu_System_Pause();
}


