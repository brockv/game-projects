/// @description Pickup Logic

// If the player can't pick this up, exit
if (!can_pickup_) exit;

// Increment the player's gem count
o_player.player_gems_ += 1;
ds_map_replace(o_game.save_data_, "Gem Count", o_player.player_gems_);

// Play a sound effect
audio_play_sound(a_collect_item, 2, false);

// Destroy the gem on pickup
instance_destroy();
