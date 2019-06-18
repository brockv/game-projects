/// @description Control Fade

if (image_alpha != target_image_alpha_)
{
	// Approach the target image alpha
	image_alpha = approach(image_alpha, target_image_alpha_, 0.1);
}
else
{
	if (image_alpha == 1)
	{
		// Reset the target image alpha
		target_image_alpha_ = 0;
		
		// Go to the next room
		room_goto(next_room_);
	}
	else
	{
		// Destroy the transition
		instance_destroy();
	}
}
