/// @description Initialize Variables

// Set the fuse time
fuse_time_ = global.one_second * 3;

// Set the alarm based on the fuse time
alarm[0] = fuse_time_;

// Set item specific variables
targets_ = [o_player, o_enemy_parent, o_destroyable_object_parent];
damage_ = 2;
knockback_ = 12;

// Set the depth
depth = -y;
