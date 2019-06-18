/// @description Attack State

// Update the image speed
image_speed = 0.85;

// Check the Stinger Alarm to make sure we only fire in intervals
if (alarm[2] <= 0) { // The alarm is at 0, go ahead and fire a stinger
	// Fire the stinger at the player
	var _stinger = instance_create_layer(x + 4, y + 2, "Instances", o_hornet_stinger);
	_stinger.image_xscale = image_xscale;
	switch (_stinger.image_xscale) {
		case 1:
			_stinger.direction_ = 0;
			break;
		
		default:
			_stinger.direction_ = 180;
			break;
	}
	_stinger.speed_ = 2;

	// Set the stinger alarm
	alarm[2] = global.one_second * 2;
	
	// Go back to idle state
	state_ = hornet.idle;
	event_user(state_);
} else { // The alarm is still counting down, revert to idle state without firing a stinger
	state_ = hornet.idle;
	event_user(state_);
}