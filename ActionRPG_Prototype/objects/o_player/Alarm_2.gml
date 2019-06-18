/// @description Stamina Regen Alarm

// Regen one point of stamina
player_stamina_ = min(player_stamina_ + 1, player_max_stamina_);

// If the player is still missing stamina, reset the alarm
if (player_stamina_ < player_max_stamina_) {
	alarm[2] = global.one_second * stamina_regen_time_;
}
