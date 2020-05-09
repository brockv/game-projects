if (event_number == 0) {
	shader_set(set_tile_transparency);
	shader_set_uniform_f(u_hidden_tile_alpha, hidden_tile_alpha);
}