// scr_Aura_CleanUp();

// Free the surfaces used at the end of the room. This should be called 
// at Room End in the main controller instance.

if surface_exists(aura_surface)
{
surface_free(aura_surface);
}

with (obj_Aura_Light_Parent)
{
Aura_Light_Free();
}

// Free up the vertex buffer
vertex_delete_buffer(aura_s_buffer);
