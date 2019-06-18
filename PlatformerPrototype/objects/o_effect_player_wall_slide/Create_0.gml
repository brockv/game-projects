/// @description Initialize variables

// Choose a random sprite, for better effect
sprite = choose(s_wall_slide_cube, s_wall_slide_hollow_cube);

// Get player facing direction
player_dir	 = o_player.facing;		// Either -1 or 1
random_spd	 = random_range(1, 3);  // Particle will move upwards with a random speed
rotation	 = 0;					// Randomly rotate sprite
rotation_dir = choose(-1, 1);	    // Direction sprite will rotate in -- (1 == anticlockwise)
alpha		 = 1;					// Reduce alpha for a fade out effect, and to get a death state to delete object