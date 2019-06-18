/// @description add_textfield(x,y,halign,font,ID);
/// @param x
/// @param y
/// @param halign
/// @param font
/// @param ID
c = instance_create(argument0, argument1, oTextField); // create the text field
c.halign = argument2; // horizontal alignment
c.font = argument3; // font
c.ID = argument4; // ID, real (unique)
