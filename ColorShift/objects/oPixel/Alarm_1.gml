/// @description Disassemble Image
//this alarm only runs when disassembling a sprite
if (!dead)
{
    //Decreasing this alarm causes the code to run more often.
    alarm[1]=5;
    image_alpha-=.02;
    image_angle+=spin;
    dead=(image_alpha<.01);
}
else
{
    instance_destroy()
}

