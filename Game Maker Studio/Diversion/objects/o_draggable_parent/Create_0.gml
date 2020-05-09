/// @description Initialize variables

// Define varaibles to control the dragging
grabbed_ = false;
xx_ = 0;
yy_ = 0;

// Set the initial frame for drawing the inactive outline
outline_frame_ = 0;
outline_frame_count_ = sprite_get_number(s_inactive_outline);