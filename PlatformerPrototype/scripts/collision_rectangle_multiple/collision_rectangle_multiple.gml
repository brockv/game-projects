/// @description collision_rectangle_multiple(x1, y1, x2, y2, object, prec, notme)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  object
/// @param  prec
/// @param  notme
///returns a ds_list of all objects in collision with the rectangle
var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var obj = argument[4];
var prec = argument[5];
var notme = argument[6];
var list = ds_list_create();
do
{
    var hit = collision_rectangle(x1, y1, x2, y2, obj, prec, notme);
    if (hit != noone)
    {
        ///Add the colliding object to the list then
        ///deactivate it so that we don't collide with it again.
        ///It'll be reactivated later on...
        ds_list_add(list, hit);
        instance_deactivate_object(hit);
    }
} until (hit == noone);

///Reactivate all the objects which we deactivated
if (ds_list_size(list) > 0)
for (var i = 0; i < ds_list_size(list); i++)
{
    instance_activate_object(list[|i]);
}

///Return the list of objects OR noone
return list;
