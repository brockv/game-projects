/// @description Player Input, View Control, And Collisions

////Controls Instances Outside / Inside The View////

////Activates All Instances////
instance_activate_all();

////Deactivates All Instances Outside The View////
instance_deactivate_region(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), false, true);

////Keeps Important Instances Activated////
instance_activate_object(obj_Always_Active);

////Exit If Game Is Paused////
if (!global.pause)
{
    image_speed = 1;
}
else
{
    image_speed = 0;
    exit;
}

////Start Screen Animation////
if (room == room_Start_Menu)
{    
    //Switch To Idle Sprite At The End Of The Path
    if (x = 208)
    {    
        sprite_index = idle_anim;
    }
}

////Game Over Screen Animation////
if (room == room_Game_Over)
{    
    //Switch To Idle Sprite At The End Of The Path
    if (x = 176)
    {    
        sprite_index = idle_anim;
    }
}

////Exit If On Game Over Screen////
if (room == room_Game_Over) exit;

////Exit If Not Playing A Level////
if (!global.game_start) exit;

////Reset Player Speed////
hsp = 5;

////Controls////

key_jump = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_face1) || mouse_check_button_pressed(mb_left);
key_jump_release = keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_face1) || mouse_check_button_released(mb_left);
key_gravity = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_shoulderrb); // || mouse_check_button_pressed(mb_right);

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
        key_gravity = 1;
        pressed = false;
        alarm[3] = 5;
    }
    else
    {
        key_gravity = 1;
        pressed = false;
        alarm[3] = 5;
    }
}



////Check For Floor Surface Above Or Below Player////
if (place_meeting(x, y + sign(grav), obj_Wall_One))
{
    global.falling = false;
    sprite_index = run_anim;
    
    if (key_jump)
    {
        //Play Jump Sound If Player Is On A Floor Surface And Jumps
        audio_play_sound(sound_Player_Jump, 0, 0);
        audio_sound_gain(sound_Player_Jump, 0.2, 0);
        //Jump With Either Upwards Or Downwards Momentum
        vsp = key_jump * jumpspeed * sign(-grav);
        global.falling = true;
        sprite_index = jump_anim;      
        
        xscale = 0.5;
        yscale = 1.1;
    }
}

////Increase Fall Speed When Jump Is Released////
if (key_jump_release) && (global.falling)
{
    
    if (vsp < 10) or (vsp > -10)
    {
        vsp = vsp / 1.75;
        sprite_index = fall_anim;
        
    }
}

////Invert Gravity////
if (global.switch_gravity)
{
    if (key_gravity)
    { 
        audio_play_sound(sound_Gravity_Switch, 0, 0);
        audio_sound_gain(sound_Gravity_Switch, 0.2, 0);
        //Invert Gravity, Disable Switching, And Flip Sprite
        grav *= -1;
        global.switch_gravity = false;
        //Image Flip Timer
        alarm[1] = 1;
        //Gravity Switch Timer
        alarm[0] = 30;
        //Animation Switch Timer
        alarm[2] = 6;
        sprite_index = float_anim;
    }
}

////React To Gravity////
switch (sign(grav))
{
    //Positive Gravity (Down)
    case 1: if (vsp < 10) vsp += grav; break;
    //Negative Gravity (Up)
    case -1: if (vsp > -10) vsp += grav; break;
}

////Check For Mega Jump Block////
if (place_meeting(x, y + sign(grav), obj_Mega_Jump))
{ 
    vsp = 28 * sign(-grav) 
    global.falling = true;
    audio_play_sound(sound_Jump, 0, 0);
    audio_sound_gain(sound_Jump, 0.2, 0);
    sprite_index = jump_anim;
    //Animation Switch Timer
    alarm[2] = 10;
    
    xscale = 0.5;
    yscale = 1.3;
}

///Collisions And Transitions

////Check Height And Kill If Necessary////
if (y <= 46) or (y >= 366)
{
    player_alive = false;

}

if (place_meeting(x, y, obj_Spike_Floor))
{
    player_alive = false;
}

////Horizontal Collision////
if (place_meeting(x + hsp, y, obj_Wall_One))
{
    while (!place_meeting(x + 1, y, obj_Wall_One))
    {
       x += 1;
    }
    
    player_alive = false;
   
}

x += hsp;
 
////Vertical Collision////
if (place_meeting(x, y + vsp, obj_Wall_One))
{
    while (!place_meeting(x, y + sign(vsp), obj_Wall_One))
    {
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

////End Of Level Transition////
if (x >= 5100)
{
    //Only Create One Instance Of obj_Level_Fade
    if (!instance_exists(obj_Level_Fade))
    {
        
        //Reset Checkpoint Variables
        global.checkpoint = noone;
        global.checkpointR = 0;
        global.checkpointx = 0;
        global.checkpointy = 0;

        //Transition
        instance_create(__view_get( e__VW.XView, 0 ) + 100, __view_get( e__VW.YView, 0 ) + 100, obj_Level_Fade);
    }
}

///Process Player Death

if (!player_alive)
{

    //Death Effect Based On Character Color

    //DEFAULT
    if (global.player_color = 0)
    {
        effect_create_above(ef_firework, x, y, 1, c_teal);
    }
    //PINK
    else if (global.player_color = 1)
    {
        effect_create_above(ef_firework, x, y, 1, c_fuchsia);
    }
    //GREEN
    else if (global.player_color = 2)
    {
        effect_create_above(ef_firework, x, y, 1, c_lime);
    }
    //RED
    else if (global.player_color = 3)
    {
        effect_create_above(ef_firework, x, y, 1, c_red);
    }
    //ORANGE
    else if (global.player_color = 4)
    {
        effect_create_above(ef_firework, x, y, 1, c_orange);
    }
    //GRAY
    else if (global.player_color = 5)
    {
        effect_create_above(ef_firework, x, y, 1, c_gray);
    }
    //CLEAR
    else
    {
        effect_create_above(ef_firework, x, y, 1, c_white);
    }
    
    

    //Vibrate Gamepad On Death
    gamepad_set_vibration(0, 1, 1);
    //Vibrate Mobile Device On Death
    //immersion_play_effect(73);

    //Play Sound On Death
    audio_play_sound(sound_Death, 1, 0);
    audio_sound_gain(sound_Death, 0.2, 0);
    
    //Increment Attempts
    global.attempt_number += 1;

    //Tell Respawner Player Is Dead
    global.player_dead = true;
    

    //Destroy Player Object On Death
    instance_destroy();
    
}

///DEBUG COMMANDS

////Restart The Game////
if (keyboard_check_pressed(vk_f12) || gamepad_button_check_pressed(0, gp_select)) { game_restart() }

////Restart Current Room////
if (keyboard_check_released(vk_f3) || gamepad_button_check_released(0, gp_shoulderlb))
{ 
    //Reset Checkpoint Variables
    global.checkpoint = noone;
    global.checkpointR = 0;
    global.checkpointx = 0;
    global.checkpointy = 0;
    room_restart(); 
}
////Skip To Next Room////
if (keyboard_check_released(vk_f1) || gamepad_button_check_released(0, gp_shoulderl))
{ 
    //Reset Checkpoint Variables
    global.checkpoint = noone;
    global.checkpointR = 0;
    global.checkpointx = 0;
    global.checkpointy = 0;
    
    //Transition To Next Room    
    instance_create(__view_get( e__VW.XView, 0 ) + 100, __view_get( e__VW.YView, 0 ) + 100, obj_Level_Fade);
    
}

