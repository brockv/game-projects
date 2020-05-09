/// @function		Aura_Get_View();
/// @description	Returns the current viewport assigned to AURA

// This getter script returns the viewport that is currently assigned for AURA.
// The script will return -1 for no view, a value between 0 and 7 for the viewport
// being used, "noone" (-4) if there is no light controller or -1 if the variable
// doesn't exist in the controller instance.

if (instance_exists(o_aura_control)) {
	if (variable_instance_exists(o_aura_control, "aura_view")) {
		return o_aura_control.aura_view;
	} else {
		return -1;
	}
} else {
	return noone;
}