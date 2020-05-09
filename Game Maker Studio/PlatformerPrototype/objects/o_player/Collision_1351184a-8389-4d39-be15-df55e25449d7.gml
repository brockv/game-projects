/// @description Connector logic

// Flip persistent on during the transition
persistent = true;

// Set the next room and starting position
room_			= other.room_;
start_position_ = other.start_;

// Create the fade transition
instance_create_layer(0, 0, "menu", o_fade_transition);


