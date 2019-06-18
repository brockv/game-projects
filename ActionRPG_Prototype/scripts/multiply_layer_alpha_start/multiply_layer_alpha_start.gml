///@arg tilemap
///@arg current_alpha
///@arg target_alpha

//var _tilemap = argument[0];
//var _current_alpha = argument[1];
//var _target_alpha = argument[2];

if (event_type == ev_draw)
{
	if (event_number == 0)
	{
		var _uniformID = shader_get_uniform(sh_multiply_alpha, "alpha")
		shader_set(sh_multiply_alpha);
		var _alpha = draw_clear_alpha(c_white, 0.5 + (lengthdir_x(.5, current_time/10))); //0.5 + lengthdir_x(.5, current_time/10);
		shader_set_uniform_f(_uniformID, _alpha);
	}
}
