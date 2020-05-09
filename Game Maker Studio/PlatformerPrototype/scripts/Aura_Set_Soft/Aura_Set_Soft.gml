/// @function					Aura_Set_Soft(soft_amount);
/// @description				Sets the current soft shadow value
/// @param {real}	soft_amount	The soft shadow value (0 for none)

// This setter script sets the softness value for the shadow shader. If you set
// it to 0, then soft shadows are disabled, and any value greater than 0 will
// enable them, setting the amount of softness at the same time. If there is no 
// light control instance the function will return "noone" (-4), or if the controller
// instance doesn't have the variable defined, it will return -1, and if the shader
// isn't compiled then it will return "false" (0), otherwise it will return "true" (1).

if instance_exists(o_aura_control)
{
if variable_instance_exists(o_aura_control, "aura_soft")
	{
	with (o_aura_control)
		{
		aura_soft = argument0;
		if aura_soft > 0
			{
			if shader_is_compiled(sh_Aura_Blur)
				{
				aura_soft_usize = shader_get_uniform(sh_Aura_Blur,"size");
				return true;
				}
			else return false;
			}
		}
	}
else return -1;
}
else return noone;