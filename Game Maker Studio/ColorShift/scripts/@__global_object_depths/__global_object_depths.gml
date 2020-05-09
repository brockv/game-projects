// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -100; // oGame
global.__objectDepths[1] = 0; // oCamera
global.__objectDepths[2] = 0; // oResolution
global.__objectDepths[3] = -9999; // oWindowScaler
global.__objectDepths[4] = -300; // oParEntity
global.__objectDepths[5] = 0; // oParSolid
global.__objectDepths[6] = 0; // oParJumpThru
global.__objectDepths[7] = 0; // oParRail
global.__objectDepths[8] = -100; // obj_Aura_Control
global.__objectDepths[9] = -100; // obj_Aura_Light_Parent
global.__objectDepths[10] = -110; // obj_Aura_ShadowCaster_Parent
global.__objectDepths[11] = -100; // obj_Aura_Point_Light
global.__objectDepths[12] = 0; // obj_Aura_Torch_Light
global.__objectDepths[13] = -200; // obj_Aura_Mouse_Light
global.__objectDepths[14] = -110; // obj_Aura_ShadowCaster_Box
global.__objectDepths[15] = -110; // obj_Aura_ShadowCaster_Rotate
global.__objectDepths[16] = -110; // obj_Aura_ShadowCaster_Circle
global.__objectDepths[17] = 0; // obj_Aura_ShadowCaster_Door
global.__objectDepths[18] = -150; // oPlayer
global.__objectDepths[19] = 0; // oExplode
global.__objectDepths[20] = -1; // oFxDust
global.__objectDepths[21] = 0; // oSensor
global.__objectDepths[22] = 0; // oBlock
global.__objectDepths[23] = 0; // oBlockBlack
global.__objectDepths[24] = 0; // oBlockWhite
global.__objectDepths[25] = -200; // oJumpThru
global.__objectDepths[26] = 0; // oBounceMover
global.__objectDepths[27] = 0; // oRailMoverH
global.__objectDepths[28] = 0; // oRailMoverV
global.__objectDepths[29] = 0; // oCircleMover
global.__objectDepths[30] = 0; // oSwitchMoverH
global.__objectDepths[31] = 0; // oSwitchMoverV
global.__objectDepths[32] = 2; // oRailH
global.__objectDepths[33] = 2; // oRailV
global.__objectDepths[34] = 0; // oDoorV
global.__objectDepths[35] = 0; // oDoorH
global.__objectDepths[36] = 0; // oPixel
global.__objectDepths[37] = 0; // oPixelMaker
global.__objectDepths[38] = 0; // oPixelMakerFast
global.__objectDepths[39] = 0; // obj_solid_block
global.__objectDepths[40] = 0; // obj_gun


global.__objectNames[0] = "oGame";
global.__objectNames[1] = "oCamera";
global.__objectNames[2] = "oResolution";
global.__objectNames[3] = "oWindowScaler";
global.__objectNames[4] = "oParEntity";
global.__objectNames[5] = "oParSolid";
global.__objectNames[6] = "oParJumpThru";
global.__objectNames[7] = "oParRail";
global.__objectNames[8] = "obj_Aura_Control";
global.__objectNames[9] = "obj_Aura_Light_Parent";
global.__objectNames[10] = "obj_Aura_ShadowCaster_Parent";
global.__objectNames[11] = "obj_Aura_Point_Light";
global.__objectNames[12] = "obj_Aura_Torch_Light";
global.__objectNames[13] = "obj_Aura_Mouse_Light";
global.__objectNames[14] = "obj_Aura_ShadowCaster_Box";
global.__objectNames[15] = "obj_Aura_ShadowCaster_Rotate";
global.__objectNames[16] = "obj_Aura_ShadowCaster_Circle";
global.__objectNames[17] = "obj_Aura_ShadowCaster_Door";
global.__objectNames[18] = "oPlayer";
global.__objectNames[19] = "oExplode";
global.__objectNames[20] = "oFxDust";
global.__objectNames[21] = "oSensor";
global.__objectNames[22] = "oBlock";
global.__objectNames[23] = "oBlockBlack";
global.__objectNames[24] = "oBlockWhite";
global.__objectNames[25] = "oJumpThru";
global.__objectNames[26] = "oBounceMover";
global.__objectNames[27] = "oRailMoverH";
global.__objectNames[28] = "oRailMoverV";
global.__objectNames[29] = "oCircleMover";
global.__objectNames[30] = "oSwitchMoverH";
global.__objectNames[31] = "oSwitchMoverV";
global.__objectNames[32] = "oRailH";
global.__objectNames[33] = "oRailV";
global.__objectNames[34] = "oDoorV";
global.__objectNames[35] = "oDoorH";
global.__objectNames[36] = "oPixel";
global.__objectNames[37] = "oPixelMaker";
global.__objectNames[38] = "oPixelMakerFast";
global.__objectNames[39] = "obj_solid_block";
global.__objectNames[40] = "obj_gun";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for