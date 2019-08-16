/// @description Destroy particle system

#region // Destroy particle system and particles 

part_system_destroy(part_sys);  
part_emitter_destroy_all(part_sys);
part_type_destroy(body_part);      

#endregion