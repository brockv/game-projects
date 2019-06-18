/// @description Silhouette Logic

// Set the blend mode and alpha testing
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

// Draw the silhouettes
with (o_silhouette_parent)
{
	switch (object_index)
	{
		case (o_player):
			gpu_set_fog(true, merge_color(c_black, c_dkgray, 0.5), 0, 1);
			break;
			
		case (o_enemy_parent):
			gpu_set_fog(true, c_dkgray, 0, 1);
			break;
			
		default:
			gpu_set_fog(false, c_ltgray, 0, 1);
			break;
	}

	draw_self();
}
gpu_set_fog(false, c_white, 0, 0);

// Reset the blend mode and alpha testing
gpu_set_blendmode(bm_normal);
gpu_set_alphatestenable(false);
