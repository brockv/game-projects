/// @description Step Logic

// Apply gravity
z_ += z_speed_;
z_speed_ += gravity_;

// Apply bounce
if (z_ >= 0)
{
	can_pickup_ = true;
	var _bounce_amount = 0.25;
	z_speed_ = -z_speed_ * _bounce_amount;
	
	if (z_speed_ > -0.5)
	{
		z_ = 0;
		z_speed_ = 0;
	}
}
