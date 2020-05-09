/// @description Controls Cursor And Handles Selections

//Controls Cursor On Menu Items
var key_accept = keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face1);
var key_cancel = keyboard_check_released(vk_escape) || gamepad_button_check_released(0, gp_face2);

if (mouse_check_button_pressed(mb_right)) && (!alarm[1])
{
    key_accept = 1;
}

//Play Sound On Cancel
if (key_cancel)
{
    audio_play_sound(sound_Selection, 1, 0);
    audio_sound_gain(sound_Selection, 0.4, 0);
}

//Go Back
if (key_cancel)
{ 
global.next_room = room_Options;
instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
//room_goto(room_Options)
}

var key_push;
//Checks For Key Presses
key_push = max(key_accept, 0);
//If Enter Or Start Are Pressed, Go To Appropriate Room
if (key_push == 1) Menu_System_Controls();

