/// @description Start Respawn And Vibration Timer
if (global.player_dead = true)
{
    //Set Respawn Timer
    alarm[0] = 30;
    //Set Vibration Timer
    alarm[1] = 5;
    //Fade Timer
    alarm[2] = 15;
    
    global.player_dead = false;
}

