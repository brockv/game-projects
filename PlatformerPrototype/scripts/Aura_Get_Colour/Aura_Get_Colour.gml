/// @function		Aura_Get_Colour();
/// @description	Returns the current colour for the penumbra

// This getter script returns the colour that is currently used for the
// penumbra (darkness). If there is no light control instance the function
// will return "noone" (-4), or if the controller instance doesn't have the
// variable defined, it will return -1.

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_colour")
	{
	return o_aura_control.aura_colour;
	}
else return -1;
}
else return noone;



