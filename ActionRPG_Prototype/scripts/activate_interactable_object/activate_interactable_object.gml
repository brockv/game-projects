///@arg xdir
///@arg ydir

var _x_dir = argument[0];
var _y_dir = argument[1];

// Is there an object?
var _interactable = instance_place(x + _x_dir, y + _y_dir, o_interactable_parent);

// If there is input and an object
if ((o_input.action_one_pressed_ || o_input.action_two_pressed_) && _interactable != noone)
{
	with (_interactable)
	{
		event_user(ACTIVATED_);
	}
}