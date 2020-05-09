/// @description Bomb State

// Create a bomb where the player is standing
instance_create_layer(x, y + 2, "Instances", o_bomb);

// Play a sound effect
audio_play_sound(a_set_bomb, 5, false);

// Transition back into the move state
state_ = player.move;
