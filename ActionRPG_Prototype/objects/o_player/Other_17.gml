/// @description Dash State

// Stop the sprite from automatically cycling
image_speed = 0;

// Apply movement properties to the player
//set_movement(input_direction_, 30);
add_movement_maxspeed(input_direction_, speed_ * 4, max_speed_ * 10);

// Create the dash effect
var _dash = instance_create_layer(x, y, "Instances", o_dash_effect);
_dash.sprite_index = sprite_index;
_dash.image_index = image_index;
_dash.image_xscale = image_xscale;

// Enable movement with the above scripts
move_movement_entity(false);

// Transition back to the move state at the end of the dash
state_ = player.move;



