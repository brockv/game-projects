/// @function				Aura_Set_Alpha(alpha);
/// @description			Sets the current alpha for the penumbra
/// @param {real}	alpha	The alpha to use (0 - 1)

// This setter script sets the alpha that is currently used for the
// penumbra (darkness). If there is no light control instance the function
// will return "noone" (-4), or if the controller instance doesn't have the
// variable defined, it will return -1, otherwise it will return "true" (1).

// Note that with this engine, an alpha value of 1 will make the shadows
// LIGHTER while an alpha value of 0 will make the light DARKER.

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_alpha")
	{
	o_aura_control.aura_alpha = clamp(argument0, 0 ,1);
	return true;
	}
else return -1;
}
else return noone;