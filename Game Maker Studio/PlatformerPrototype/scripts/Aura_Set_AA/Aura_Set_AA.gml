/// @function					Aura_Set_AA(aa_level);
/// @description				Enables / Disables anti-aliasing for shadow edges
/// @param {real}	aa_level	Set to 0 for no aa, or 2, 4, or 8 for different levels of aa

// This setter script sets the anti-aliasing value for shadow edges. If you set
// it to 0, then aa is disabled, and setting it to 2, 4, or 8 will enable it with
// that level of aa (if supported). If there is no light control instance the 
// function will return "noone" (-4), or if the controller instance doesn't have
// the variable defined, it will return -1, otherwise it will return "true" (1).

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_aa")
	{
	var _max_aa = 0;
	if display_aa >= 12
	    {
		_max_aa = 8;
	    }
	else
	    {
	    if display_aa >= 6
	        {
			_max_aa = 4;
	        }
	    else
	        {
	        if display_aa >= 2
	            {
				_max_aa = 2;
	            }
	        else
	            {
	            _max_aa = 0;
	            }
	        }
	    }
	if _max_aa < argument0
		{
		o_aura_control.aura_aa = _max_aa;
		}
	else
		{
		o_aura_control.aura_aa = argument0;
		}
	display_reset(o_aura_control.aura_aa, false);
	return true;
	}
else return -1;
}
else return noone;