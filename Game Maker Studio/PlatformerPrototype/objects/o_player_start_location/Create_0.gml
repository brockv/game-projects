/// @description Create player

spawn_x_ = x;
spawn_y_ = y;

checkpoint_		= noone;

// Create our player if they don't exist on room start
if (!instance_exists(o_player)) instance_create_layer(spawn_x_, spawn_y_, "player", o_player);

// Player death timer -- used to recreate the player after a couple of frames have passed
player_death_max_timer_	= 30; // Number of frames player will stay dead
player_death_timer_		= player_death_max_timer_; 