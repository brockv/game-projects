/// @function		Aura_Get_Soft();
/// @description	Returns the current soft shadow setting

// This getter script returns the soft shadow setting that is currently used for
// shadows. The script will return 0 for no soft shadows, greater than 0 for the 
// soft shadow level, "noone" (-4) if there is no light controller or -1 if the
// variable doesn't exist in the controller instance.

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_soft")
	{
	return o_aura_control.aura_soft;
	}
else return -1;
}
else return noone;