/// @description Initialize Menu Array
menu[0] = "Start Game";
menu[1] = "High Scores"; //"Select Color";
menu[2] = "Options";     //"Controls";
menu[3] = "Quit Game";

window_set_cursor(cr_none);

//Touch Controls
can_press = true;
pressed = false;
my = 0;
mx = 0;
swipe_min = 50;

//Set Spacing Between Items
space = 32;
mpos = 0;

//Prepare Cursor For Animation
next_frame = 0;

//Initialize engine
/*
button_init();

but_dpad = button_create(0, -1, spr_gameboy_dpad, -1, 100, view_hview-100, 1);
but_a = button_create(2, (vk_up || gp_padu), spr_gameboy_round, -1, view_wview-70, view_hview-120, 1);
but_b = button_create(2, (vk_down || gp_padd), spr_gameboy_round, -1, view_wview-200, view_hview-70, 1);
*/

/* */
/*  */
