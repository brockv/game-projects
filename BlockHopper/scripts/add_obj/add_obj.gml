/// @description  add_obj(GameMaker_Object,sprite,count,maxOccurences,minOccurences);
/// @param GameMaker_Object
/// @param sprite
/// @param count
/// @param maxOccurences
/// @param minOccurences
object[counter] = argument0; // object
sprite[counter] = argument1; // sprite
maxobj[counter] = argument2; // max occurences
minobj[counter] = argument3; // min occurences

countobj[counter] = 0; // the number of instances in the level editor for the particular object

// if there is no need for a maximum, set the maximum value to the grid size plus one
// any arbitrary number will do
if (maxobj[counter] < 1) {
    maxobj[counter] = (horSize * vertSize) + 1;
}

counter++; // increase the number of objects
