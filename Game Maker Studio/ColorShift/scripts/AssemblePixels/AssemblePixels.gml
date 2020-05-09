/// @description AssemblePixels(x,y,object,sprite,acceleration,pixel size,image blend,assemble)
/// @param x
/// @param y
/// @param object
/// @param sprite
/// @param acceleration
/// @param pixel size
/// @param image blend
/// @param assemble
//by Ground Effect Games
//if assemble=true, assembles a sprite from pixels, then creates specified object.
//if false, explodes an object into pixels, then creates specified object.

//acceleration determines how fast the image is assembled
if (sqr(argument4)<=room_speed)
{
    with instance_create(argument0,argument1,oPixelMaker)
    {
        object=argument2;
        count=0;
        sprite_index = argument3;
        accel = max(1,argument4);
        size = argument5;
        half=size/2;
        image_blend=argument6;
        assemble=argument7;
        image_angle=other.image_angle;
        xoffset=sprite_get_xoffset(sprite_index);
        yoffset=sprite_get_yoffset(sprite_index);
        //the maker uses a loop that has to start at the top left of the image.
        ii=0;
        jj=0;
        //rate=interval, in seconds, at which individual pixels are created
        //room speed is the maximum rate. This prevents maxing out the CPU
        rate=1/sqr(accel);
        alarm0=rate;
        sec=delta_time/1000000;
        total=ceil(sprite_height/size)*ceil(sprite_width/size);
        dist=0;
        theta=0;
    }
}
else
{
    with instance_create(argument0,argument1,oPixelMakerFast)
    {
        object=argument2;
        count=0;
        sprite_index = argument3;
        accel = max(1,argument4);
        size = argument5;
        half=size/2;
        image_blend=argument6;
        assemble=argument7;
        image_angle=other.image_angle;
        xoffset=sprite_get_xoffset(sprite_index);
        yoffset=sprite_get_yoffset(sprite_index);
        //the maker uses a loop that has to start at the top left of the image.
        ii=0;
        jj=0;
        rate=sprite_height/(sqr(accel)*size);
        alarm0=rate;
        sec=delta_time/1000000;
        total=ceil(sprite_height/size)*ceil(sprite_width/size);
        dist=0;
        theta=0;
    }
}
