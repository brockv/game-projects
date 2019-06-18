/// @function				Aura_Set_Colour(colour);
/// @description			Sets the current colour for the penumbra
/// @param {real}	colour	The colour to use

// This setter script sets the colour that is currently used for the
// penumbra (darkness). If there is no light control instance the function
// will return "noone" (-4), or if the controller instance doesn't have the
// variable defined, it will return -1, otherwise it will return "true" (1).

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_colour")
	{
	o_aura_control.aura_colour = argument0;
	return true;
	}
else return -1;
}
else return noone;