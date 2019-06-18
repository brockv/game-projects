/// @description Collision Logic

// If the player can't pick the item up, exit
if (!can_pickup_) exit;

// Run the event specific to the item picked up
event_user(PICKED_UP_);
