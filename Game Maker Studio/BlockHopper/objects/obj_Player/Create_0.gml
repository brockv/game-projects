/// @description Initialize Variables
grav = 2;
hsp = 5;
vsp = 0;
jumpspeed = 16;
player_alive = true;
global.switch_gravity = true;

//Touch Controls
can_press = true;
pressed = false;
my = 0;
mx = 0;
swipe_min = 65;

onGround = On_Ground();

////For Squash And Stretch////
xscale = 1;
yscale = 1;

////Determines Which Sprites To Use////

////DEFAULT////
if (global.player_color = 0)
{
    idle_anim = spr_Idle;
    run_anim = spr_Run;
    jump_anim = spr_Jumping;
    fall_anim = spr_Fall;
    float_anim = spr_Float;
}
////PINK////
else if (global.player_color = 1)
{
    idle_anim = spr_Idle_Pink;
    run_anim = spr_Run_Pink;
    jump_anim = spr_Jumping_Pink;
    fall_anim = spr_Fall_Pink;
    float_anim = spr_Float_Pink;
}
////GREEN////
if (global.player_color = 2)
{
    idle_anim = spr_Idle_Green;
    run_anim = spr_Run_Green;
    jump_anim = spr_Jumping_Green;
    fall_anim = spr_Fall_Green;
    float_anim = spr_Float_Green;
}
////RED////
else if (global.player_color = 3)
{
    idle_anim = spr_Idle_Red;
    run_anim = spr_Run_Red;
    jump_anim = spr_Jumping_Red;
    fall_anim = spr_Fall_Red;
    float_anim = spr_Float_Red;
}
////ORANGE////
else if (global.player_color = 4)
{
    idle_anim = spr_Idle_Orange;
    run_anim = spr_Run_Orange;
    jump_anim = spr_Jumping_Orange;
    fall_anim = spr_Fall_Orange;
    float_anim = spr_Float_Orange;
}
////GRAY////
else if (global.player_color = 5)
{
    idle_anim = spr_Idle_Gray;
    run_anim = spr_Run_Gray;
    jump_anim = spr_Jumping_Gray;
    fall_anim = spr_Fall_Gray;
    float_anim = spr_Float_Gray;
}
////CLEAR////
else if (global.player_color = 6)
{
    idle_anim = spr_Idle_Clear;
    run_anim = spr_Run_Clear;
    jump_anim = spr_Jumping_Clear;
    fall_anim = spr_Fall_Clear;
    float_anim = spr_Float_Clear;
}

///If Player Reached The Checkpoint, Spawn There////
if (global.checkpointR == room)
{
    x = global.checkpointx + 48;
    y = global.checkpointy - 2;
}

if (room == room_Start_Menu) or (room == room_Game_Over) or (room == room_Options)
{
    sprite_index = run_anim;
}

