///// @description Random level tests

if (room == rm_world_1_level_1) {
	// Define the names used in the room editor
	var _section = "Section";
	var _subsection = "Sub";
	
	// Get the total number of sections
	var _num_sections = 0;
	while (layer_exists(_section + string(_num_sections + 1))) {
		_num_sections++;
	}
	
	// Loop through each section and get a pick a random sub section
	for (var _i = 1; _i < _num_sections + 1; ++_i) {
		// Get the total number of sub sections
		var _num_subsections = 0;
		while (layer_exists(_subsection + string(_i) + "_" + string(_num_subsections + 1))) {
			_num_subsections++;
		}
		
		// Pick a random sub section to use
		var _chosen_subsection = irandom_range(1, _num_subsections);
		
		// Destroy the unused subsections
		for (var _ii = 1; _ii < _num_subsections + 1; ++_ii) {
			if (_ii != _chosen_subsection) {
				var _suffix = string(_i) + "_" + string(_ii);
				layer_destroy("Grass"		 + _suffix);
				layer_destroy("JumpThrough"  + _suffix);
				layer_destroy("Player"		 + _suffix);
				layer_destroy("Spikes"		 + _suffix);
				layer_destroy("GrassObjects" + _suffix);
				layer_destroy("Collisions"   + _suffix);
			}
		}
	
		// Set the visibility of the sub section we're using, just in case it's incorrect in the room editor
		var _suffix = string(_i) + "_" + string(_chosen_subsection);
		layer_set_visible("Grass"		 + _suffix, true);
		layer_set_visible("JumpThrough"  + _suffix, true);
		layer_set_visible("Player"		 + _suffix, true);
		layer_set_visible("Spikes"		 + _suffix, true);
		layer_set_visible("GrassObjects" + _suffix, true);
		layer_set_visible("Collisions"	 + _suffix, false);
	}
}
