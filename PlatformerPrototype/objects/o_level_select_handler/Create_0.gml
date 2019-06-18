/// @description Create level arrays
// This object remains persistent and is only created once at the start of the game to store all the level details

// Create a 2D array to store all level information (DS Grids and lists would also work)

// Create global variables so we can acces the arrays in other objects
globalvar one, two; // Add more here as more worlds get added

////// WORLD 1
one[0, 0] = "1";				// Level number
one[0, 1] = rm_world_1_level_1;	// Room name
one[0, 2] = 1;					// Level unlocked -- changed based on whether a level has been unlocked. Set to true the first time the player visits the room.

/* We can add extra information here, such as checks to see if an item has been collected in the level, or a  
   timer variable to see how fast the level has been completed. The list is endless. */

one[1, 0] = "2";				// Level number
one[1, 1] = rm_world_1_level_2;	// Room name
one[1, 2] = 0;					// Level unlocked

////// WORLD 2
two[0, 0] = "1";				// Level number
two[0, 1] = rm_world_2_level_1;	// Room name
two[0, 2] = 0;					// Level unlocked

two[1, 0] = "2";				// Level number
two[1, 1] = rm_world_2_level_2;	// Room name
two[1, 2] = 0;					// Level unlocked

////// WORLD 3
/* EXAMPLE EXPANSION OF ANOTHER WORLD
three[0,0] = "1";					// Level number
three[0,1] = rm_world_3_level_1;	// Room name
three[0,2] = 0;						// Level unlocked

three[1,0] = "2";					// Level number
three[1,1] = rm_world_3_level_2;	// Room name
three[1,2] = 0;						// Level unlocked

three[2,0] = "3";					// Level number
three[2,1] = rm_world_3_level_3;	// Room name
three[2,2] = 0;						// Level unlocked
*/