/// @description Step logic

// Apply floating effect
x = xstart + x_rad_ * sin(time_ + pi / 2) * direction_;
y = ystart + y_rad_ * sin(2 * time_) * direction_;

// Increment the timer, then reset it if necessary
time_ += delta_time_;
if (time_ >= 2 * pi) {
  time_ -= 2 * pi;
}

