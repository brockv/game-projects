/// @description Respawn Timer

//Respawn At Checkpoint Or Restart Room

if (global.checkpointR != 0)
{
    room_goto(global.checkpointR);        
}
else
{
    room_restart();
}

