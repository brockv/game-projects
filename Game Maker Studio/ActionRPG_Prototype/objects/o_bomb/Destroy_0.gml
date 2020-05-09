/// @description Create Effect

// Create the effect
create_animation_effect(s_explosion_effect, x, y, 1, true);

// Create a hitbox for damaging other objects
create_hitbox(s_bomb_hitbox, x, y - 4, 0, 3, targets_, damage_, knockback_);

// Play a sound effect
audio_play_sound(a_explosion, 7, false);

// Shake the screen
with (o_camera)
{
	alarm[0] = 2;
	screen_shake_ = true;
}

// Check for breakable walls
if (tile_meeting_bomb_walls(x, y - 4))
{
	layer_destroy(layer_get_id("Bomb_Walls"));
}
