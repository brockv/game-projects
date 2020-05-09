///@arg direction

direction_facing_ = round(argument[0] / 90);

// Safety check for facing enum (only goes from 0 - 3)
if (direction_facing_ == 4) {
	direction_facing_ = 0;
}