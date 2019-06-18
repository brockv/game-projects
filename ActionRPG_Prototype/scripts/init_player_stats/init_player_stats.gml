///@description Loads the starting stats for the player

show_debug_message("Initializing player stats...");

// Facing control
direction_facing_ = dir.down;
evade_direction_ = 0;
input_direction_ = noone;

// Movement stats
acceleration_ = 0.75;
max_speed_ = 1.5;
evade_speed_ = 2.25;
sword_damage_ = 0;
can_dash_ = true;

// Starting room and position
room_ = r_world;
start_position_ = i_game_start;

// Player stats
player_max_stamina_ = 3;
player_stamina_ = player_max_stamina_;
stamina_regen_time_ = 1.25;
player_max_health_ = 3;
player_health_ = player_max_health_;
player_gems_ = 0;

// Player consumables
max_bombs = 5;
bombs = max_bombs;
max_health_potions = 0;
health_potions = max_health_potions;


