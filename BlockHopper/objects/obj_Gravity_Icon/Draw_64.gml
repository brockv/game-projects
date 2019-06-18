/// @description Draw Gravity Icon

///Positioning For Icon
x = (display_get_gui_width() / 2) - 120; //249;
y = 0;  //display_get_gui_height() - 384;

if (global.switch_gravity = true)
{
    draw_sprite(spr_Gravity_Icon, 1, x, y);
}
else
{
    draw_sprite(spr_Gravity_Icon, 0, x, y); 
}

