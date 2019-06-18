/// @description Draw level and room names
// x and y position to draw the text
var xpos = room_width-40; // Where to start drawing the x-position of the text
var ypos = 20;			  // Where to start drawing the y-position of the text

// Draw room names according to what room the player is in, and unlock new levels
switch (room) {

	// World 1
	case rm_world_1_level_1: draw_text(xpos, ypos, "1-1"); // Draw level name
								  one[0, 2] = 1; break;	   // Level unlocked to true, after first visit
	case rm_world_1_level_2: draw_text(xpos, ypos, "1-2"); // Draw level name
								  one[1, 2] = 1; break;	   // Level unlocked to true, after first visit
	
	// World 2
	case rm_world_2_level_1: draw_text(xpos, ypos, "2-1"); // Draw level name
								  two[0, 2] = 1; break;	   // Level unlocked to true, after first visit
	case rm_world_2_level_2: draw_text(xpos, ypos, "2-2"); // Draw level name
								  two[1, 2] = 1; break;	   // Level unlocked to true, after first visit
/* Example for more worlds
	// World 3
	case rm_world_3_level_1	: draw_text(xpos, ypos, "3-1"); // Draw level name
								  three[0, 2] = 1; break;   // Level unlocked to true, after first visit
	case rm_world_3_level_2	: draw_text(xpos, ypos, "3-2"); // Draw level name
								  three[1, 2] = 1; break;   // Level unlocked to true, after first visit
*/
	default: ; break;
}