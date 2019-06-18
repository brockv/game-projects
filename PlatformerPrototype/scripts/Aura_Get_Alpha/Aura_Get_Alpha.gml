/// @function		Aura_Get_Alpha();
/// @description	Returns the current alpha for the penumbra (0 - 1)

// This getter script returns the alpha that is currently used for the
// penumbra (darkness). If there is no light control instance the function
// will return "noone" (-4), or if the controller instance doesn't have the
// variable defined, it will return -1.

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_alpha")
	{
	return o_aura_control.aura_alpha;
	}
else return -1;
}
else return noone;




