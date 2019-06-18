/// @description Initialize Menu Array
if (global.difficulty_path = "Easy")
{
    menu[0] = "TOP EASY TIMES";
}
else if (global.difficulty_path = "Medium")
{
    menu[0] = "TOP MEDIUM TIMES";
}
else if (global.difficulty_path = "Hard")
{
    menu[0] = "TOP HARD TIMES";
}

menu[1] = "Return";

//Set Spacing Between Items
space = 32;
mpos = 1;

//Touch Controls
can_press = true;
pressed = false;
my = 0;
mx = 0;
swipe_min = 50;

//Prepare Cursor For Animation
next_frame = 0;

