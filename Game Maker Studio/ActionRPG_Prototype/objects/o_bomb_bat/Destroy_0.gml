/// @description Create Effect

if (state_ == bomb_bat.attack)
{
	// Create the effect
	create_animation_effect(s_explosion_effect, x, y - 6, 1, true);

	// Create a hitbox for damaging other objects
	create_hitbox(s_bomb_hitbox, x, y - 4, 0, 3, targets_, damage_, knockback_);

	// Play a sound effect
	audio_play_sound(a_explosion, 7, false);
}
else
{
	// Create a death effect
	var _sprite = s_death_effect;
	var _image_speed = 1;
	var _has_depth = true;
	create_animation_effect(_sprite, x, y - 6, _image_speed, _has_depth);
}

// Create the chance for item drops
if (chance(0.75))
{
	var _item = choose(o_gem_pickup, o_heart_pickup);
	instance_create_layer(x, y + 6, "Instances", _item);
}

