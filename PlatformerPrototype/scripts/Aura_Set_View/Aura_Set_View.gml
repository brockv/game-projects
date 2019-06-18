/// @function					Aura_Set_View(viewport);
/// @description				Set the AURA surface to use a different view port
/// @param {real}	viewport	Set to -1 for full room, or 0 - 7 for a viewport

// This setter script sets the viewport for drawing the AURA surface. If you set
// it to -1, then the engine will cover the full room, and setting it to a 
// viewport will make the engine draw only within the view. If there is no light 
// control instance the function will return "noone" (-4). If the controller 
// instance doesn't have the variable defined it will return -1. If there is an 
// issue with creating the resized surface it will return "false" (0). If successful
// it will return "true" (1).

// Note that changing the view port in this way will mean a complete reset of the
// lighting system and all surfaces that are contained within. This shouldn't be
// an issue, but it's not recommended that you change the view in this way after
// initialsing the engine within a room.

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_view")
	{
	var _ov = Aura_Get_View();
	o_aura_control.aura_view = argument0;
	if !Aura_ReInit(5)
	    {
	    // surface doesn't exist so something is wrong and we go back to the previous setting
		o_aura_control.aura_view = _ov;
		return false;
	    }
	else
		{
		return true;
		}
	}
else return -1;
}
else return noone;