// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 1; // obj_Wall_One
global.__objectDepths[1] = 1; // obj_Wall_Two
global.__objectDepths[2] = 1; // obj_Wall_Three
global.__objectDepths[3] = 50; // obj_Wall_Four
global.__objectDepths[4] = 1; // obj_End_Level
global.__objectDepths[5] = 1; // obj_End_Path
global.__objectDepths[6] = 0; // obj_Mega_Jump
global.__objectDepths[7] = 0; // obj_Checkpoint
global.__objectDepths[8] = 50; // obj_Spike_Floor
global.__objectDepths[9] = 1; // obj_Spike_Ceiling
global.__objectDepths[10] = 1; // obj_Spike_Left
global.__objectDepths[11] = 1; // obj_Player
global.__objectDepths[12] = -1; // obj_Dust
global.__objectDepths[13] = 0; // obj_Menu_Start_Screen
global.__objectDepths[14] = 0; // obj_Menu_Options
global.__objectDepths[15] = 0; // obj_Menu_Level_Select
global.__objectDepths[16] = 0; // obj_Menu_Controls
global.__objectDepths[17] = 0; // obj_Menu_Game_Over
global.__objectDepths[18] = 0; // obj_Menu_Scores
global.__objectDepths[19] = 0; // obj_Menu_Table_Select
global.__objectDepths[20] = 0; // obj_Menu_Tables
global.__objectDepths[21] = 0; // obj_Initialize
global.__objectDepths[22] = 0; // obj_Gravity_Icon
global.__objectDepths[23] = 0; // obj_Pause_Controller
global.__objectDepths[24] = -100; // obj_Attempts_Controller
global.__objectDepths[25] = -100; // obj_Countup_Controller
global.__objectDepths[26] = 0; // obj_Draw_Scores
global.__objectDepths[27] = 0; // obj_Video_Player
global.__objectDepths[28] = 0; // obj_Always_Active
global.__objectDepths[29] = -1000; // obj_Menu_Fade
global.__objectDepths[30] = -1000; // obj_Spawn_Fade
global.__objectDepths[31] = -1000; // obj_Level_Fade
global.__objectDepths[32] = 0; // obj_Respawn
global.__objectDepths[33] = 0; // obj_Title
global.__objectDepths[34] = 0; // obj_Game_Over
global.__objectDepths[35] = 0; // obj_Players
global.__objectDepths[36] = 0; // obj_Times
global.__objectDepths[37] = 0; // obj_Attempts
global.__objectDepths[38] = 0; // object_UP
global.__objectDepths[39] = 0; // object_SPACE
global.__objectDepths[40] = 0; // object_CONTROLS
global.__objectDepths[41] = 0; // object_PAUSE
global.__objectDepths[42] = 0; // object_CONFIRM
global.__objectDepths[43] = 0; // object_INVERT
global.__objectDepths[44] = 0; // object_JUMP
global.__objectDepths[45] = 0; // object_ENTER
global.__objectDepths[46] = 0; // object_ESC
global.__objectDepths[47] = 1; // object_360
global.__objectDepths[48] = 0; // object_360_JUMP
global.__objectDepths[49] = 0; // object_360_PAUSE
global.__objectDepths[50] = 0; // object_360_NAV
global.__objectDepths[51] = 0; // object_GAMEPAD
global.__objectDepths[52] = 0; // object_360_INVERT
global.__objectDepths[53] = 0; // oEditor
global.__objectDepths[54] = 0; // oTextField
global.__objectDepths[55] = -99999; // oMessage


global.__objectNames[0] = "obj_Wall_One";
global.__objectNames[1] = "obj_Wall_Two";
global.__objectNames[2] = "obj_Wall_Three";
global.__objectNames[3] = "obj_Wall_Four";
global.__objectNames[4] = "obj_End_Level";
global.__objectNames[5] = "obj_End_Path";
global.__objectNames[6] = "obj_Mega_Jump";
global.__objectNames[7] = "obj_Checkpoint";
global.__objectNames[8] = "obj_Spike_Floor";
global.__objectNames[9] = "obj_Spike_Ceiling";
global.__objectNames[10] = "obj_Spike_Left";
global.__objectNames[11] = "obj_Player";
global.__objectNames[12] = "obj_Dust";
global.__objectNames[13] = "obj_Menu_Start_Screen";
global.__objectNames[14] = "obj_Menu_Options";
global.__objectNames[15] = "obj_Menu_Level_Select";
global.__objectNames[16] = "obj_Menu_Controls";
global.__objectNames[17] = "obj_Menu_Game_Over";
global.__objectNames[18] = "obj_Menu_Scores";
global.__objectNames[19] = "obj_Menu_Table_Select";
global.__objectNames[20] = "obj_Menu_Tables";
global.__objectNames[21] = "obj_Initialize";
global.__objectNames[22] = "obj_Gravity_Icon";
global.__objectNames[23] = "obj_Pause_Controller";
global.__objectNames[24] = "obj_Attempts_Controller";
global.__objectNames[25] = "obj_Countup_Controller";
global.__objectNames[26] = "obj_Draw_Scores";
global.__objectNames[27] = "obj_Video_Player";
global.__objectNames[28] = "obj_Always_Active";
global.__objectNames[29] = "obj_Menu_Fade";
global.__objectNames[30] = "obj_Spawn_Fade";
global.__objectNames[31] = "obj_Level_Fade";
global.__objectNames[32] = "obj_Respawn";
global.__objectNames[33] = "obj_Title";
global.__objectNames[34] = "obj_Game_Over";
global.__objectNames[35] = "obj_Players";
global.__objectNames[36] = "obj_Times";
global.__objectNames[37] = "obj_Attempts";
global.__objectNames[38] = "object_UP";
global.__objectNames[39] = "object_SPACE";
global.__objectNames[40] = "object_CONTROLS";
global.__objectNames[41] = "object_PAUSE";
global.__objectNames[42] = "object_CONFIRM";
global.__objectNames[43] = "object_INVERT";
global.__objectNames[44] = "object_JUMP";
global.__objectNames[45] = "object_ENTER";
global.__objectNames[46] = "object_ESC";
global.__objectNames[47] = "object_360";
global.__objectNames[48] = "object_360_JUMP";
global.__objectNames[49] = "object_360_PAUSE";
global.__objectNames[50] = "object_360_NAV";
global.__objectNames[51] = "object_GAMEPAD";
global.__objectNames[52] = "object_360_INVERT";
global.__objectNames[53] = "oEditor";
global.__objectNames[54] = "oTextField";
global.__objectNames[55] = "oMessage";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for