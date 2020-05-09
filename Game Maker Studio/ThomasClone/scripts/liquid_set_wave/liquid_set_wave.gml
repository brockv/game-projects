/// @description liquid_set_wave(id, wave, waveamount, wavespeed)
/// @param id
/// @param  wave
/// @param  waveamount
/// @param  wavespeed
/*
    Changes the automatic waves settings of the liquid
    
    ARGUMENTS
        id - real - id of liquid object
        wave - boolean - whether the liquid will wobble at the surface
        waveamount - real - amount in pixels waves can bob from the surface
        wavespeed - real - 1-180 lower numer yeilds a slower speed - use low numbers for realistic results
*/
    
    //update variables
    argument0.liquidwave = argument1;
    argument0.liquidwaveamount = argument2;
    argument0.liquidwavespeed = clamp(argument3, 1, 180);
