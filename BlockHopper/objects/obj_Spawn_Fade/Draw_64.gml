/// @description Performs Fade Transition


////Adjust myAlpha Using myFade////
myAlpha = clamp(myAlpha + (myFade * 0.06), 0, 1);

//Fade Out
if (myAlpha == 1)
{
    myFade = -1;
}

//Destroy _Spawn_Fade After Transition
if (myAlpha == 0) && (myFade == -1)
{
    instance_destroy();
}

//Draw Fade Transition
draw_set_color(c_black);
draw_set_alpha(myAlpha);
draw_rectangle(
    0,
    0,
    display_get_gui_width(),  //view_xview[0] + view_wview[0],
    display_get_gui_height(), //view_yview[0] + view_hview[0],
    0,
);

draw_set_alpha(1);

