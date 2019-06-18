// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -100; // oGame
global.__objectDepths[1] = 0; // oParEntity
global.__objectDepths[2] = 0; // oParJumpThru
global.__objectDepths[3] = 0; // oParSolid
global.__objectDepths[4] = 0; // oParRail
global.__objectDepths[5] = 0; // oBlock
global.__objectDepths[6] = 0; // oRailMoverH
global.__objectDepths[7] = 0; // oRailMoverV
global.__objectDepths[8] = 0; // oBounceMover
global.__objectDepths[9] = 0; // oSwitchMoverH
global.__objectDepths[10] = 0; // oSwitchMoverV
global.__objectDepths[11] = 0; // oCircleMover
global.__objectDepths[12] = 1; // oPathMover
global.__objectDepths[13] = 2; // oRail
global.__objectDepths[14] = 2; // oRail2
global.__objectDepths[15] = 2; // oRailTop
global.__objectDepths[16] = 2; // oRailRight
global.__objectDepths[17] = 2; // oRailBottom
global.__objectDepths[18] = 2; // oRailLeft
global.__objectDepths[19] = 0; // oPlayer
global.__objectDepths[20] = -1; // oFxDust


global.__objectNames[0] = "oGame";
global.__objectNames[1] = "oParEntity";
global.__objectNames[2] = "oParJumpThru";
global.__objectNames[3] = "oParSolid";
global.__objectNames[4] = "oParRail";
global.__objectNames[5] = "oBlock";
global.__objectNames[6] = "oRailMoverH";
global.__objectNames[7] = "oRailMoverV";
global.__objectNames[8] = "oBounceMover";
global.__objectNames[9] = "oSwitchMoverH";
global.__objectNames[10] = "oSwitchMoverV";
global.__objectNames[11] = "oCircleMover";
global.__objectNames[12] = "oPathMover";
global.__objectNames[13] = "oRail";
global.__objectNames[14] = "oRail2";
global.__objectNames[15] = "oRailTop";
global.__objectNames[16] = "oRailRight";
global.__objectNames[17] = "oRailBottom";
global.__objectNames[18] = "oRailLeft";
global.__objectNames[19] = "oPlayer";
global.__objectNames[20] = "oFxDust";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for