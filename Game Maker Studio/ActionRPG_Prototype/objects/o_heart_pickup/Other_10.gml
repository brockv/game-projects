/// @description Pickup Logic

// If the player can't pick this up, exit
if (!can_pickup_) exit;

// Destroy the gem on pickup
instance_destroy();

// Increment the player's current health
o_player.player_health_ = min(o_player.player_health_ + 1, o_player.player_max_health_);

// Play a sound effect
audio_play_sound(a_collect_heart, 2, false);
