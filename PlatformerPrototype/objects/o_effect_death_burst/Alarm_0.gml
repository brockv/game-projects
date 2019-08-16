/// @description Insert description here
// You can write your code in this editor

#region // Destroy particle system and particles 

part_system_destroy(part_sys);  
part_emitter_destroy_all(part_sys);    

#endregion

instance_destroy();