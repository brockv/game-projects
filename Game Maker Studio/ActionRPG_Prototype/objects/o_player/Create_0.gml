/// @description Initialize Variables

// Stop the sprite from automatically cycling
image_speed = 0;

// Initialize movement entity variables
var _friction = 0.5;
var _bounce = 1;
var _collision_object = o_solid;

// Initialize the player
initialize_movement_entity(_friction, _bounce, _collision_object);
initialize_hurtbox_entity();

// Load the player's initial stats
init_player_stats();

// Load the saved stats, if they exist
load_player_stats();

#region // Player Enums
// Enum to control the player's states
enum player {
	move,
	sword,
	evade,
	bomb,
	bow,
	found_item,
	hit,
	dash,
	sword_hold,
	sword_charged_attack
}

// Enum to control the player's facing
enum dir {
	right,
	up,
	left,
	down
}
#endregion

// State control
starting_state_ = player.move;
state_ = starting_state_;

// Initialize the look-up tables for the player sprites
sprite_look_up();

// The tilemap hidden areas are located on
//hidden_tilemap_ = layer_get_id("Tiles_Hidden_Area");

// ---------- DEBUG ONLY ----------

// Add an item to the inventory
inventory_add_item(o_ring_item);
inventory_add_item(o_bomb_item);

global.item[0] = noone;
global.item[1] = o_ring_item;

// ---------- DEBUG ONLY ----------