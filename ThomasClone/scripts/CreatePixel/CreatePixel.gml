//CreatePixel(assemble)
//This function is run by oPixelMaker and should not be called by the user directly
//small changes here have a big impact!
if argument0
{
    dist=random(sqrt(sprite_width*sprite_height)*2);
    theta=random(2*pi);
    with instance_create(x+dist*cos(theta),y+dist*sin(theta),oPixel)
    {
        maker = other.id;
        image_alpha=0;
        image_blend=maker.image_blend;
        sprite_index=maker.sprite_index;
        size=maker.size;
        half=size/2;
        left=maker.ii;
        top=maker.jj;
        xdest = maker.x+maker.ii-maker.xoffset+half;
        ydest = maker.y+maker.jj-maker.yoffset+half;
        friction=1/room_speed;
        speed=random(5/maker.accel);
        direction=point_direction(x,y,xdest,ydest)+random(180)-90;
        dist=0;
        dead=0;
        alarm[0]=1;
    }
}
else
{//newX = x*cos(angle) - x*sin(angle)
 //newY = x*sin(angle) + y*cos(angle)
    count+=1;
    var xr=ii-xoffset+half;
    var yr=jj-yoffset+half;
    //image_angle=0;
    var xx=lengthdir_x(xr,image_angle) - lengthdir_y(xr,image_angle);
    var yy=lengthdir_y(xr,image_angle) - lengthdir_x(yr,image_angle);
    with instance_create(x+xx,y+yy,oPixel)
    {
        maker = other.id;
        left=maker.ii;
        top=maker.jj;
        size=maker.size;
        half=size/2;
        sprite_index=maker.sprite_index;
        image_blend=maker.image_blend;
        image_angle=maker.image_angle;
        direction=random(360);
        dead=0;
        if (maker.count==maker.total)
        {
            with maker
            {
                with instance_create(x,y,object)
                {
                    image_blend=other.image_blend;
                    image_angle=other.image_angle;
                }
                instance_destroy()
            }
            with oPixel
            {
                if (maker==other.maker)
                {
                    speed=1+random(10);
                    spin=random(speed)-speed;
                    alarm[1]=1;
                }
            }
        }
    }
}
