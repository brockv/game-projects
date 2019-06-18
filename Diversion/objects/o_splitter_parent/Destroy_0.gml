///@description Destroy logic

// Destroy the base object
//with (inst_) {
//    instance_destroy()
//}

// Destroy the particle system attached to this splitter
part_system_destroy(PartSystem)

// Destroy the color list attached to this splitter
ds_list_destroy(color_list_);

