/// @description Set Checkpoint Position And Change Image

if (place_meeting(x, y, obj_Player))
{
    global.checkpoint = id;
    global.checkpointx = x;
    global.checkpointy = y;
    global.checkpointR = room;
    if (checkpoint_noise = true)
    {
        audio_play_sound(sound_Checkpoint, 80, false);
        audio_sound_gain(sound_Checkpoint, 0.2, 0);
        checkpoint_noise = false;
    }
}

if (global.checkpointR == room)
{
    if (global.checkpoint == id) image_index = 1; else image_index = 0;
}

