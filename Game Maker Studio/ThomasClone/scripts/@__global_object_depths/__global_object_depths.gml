// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -140; // oLevelGoal
global.__objectDepths[1] = -100; // oGame
global.__objectDepths[2] = 0; // oCamera
global.__objectDepths[3] = 0; // oResolution
global.__objectDepths[4] = 0; // oPlayerSpawner
global.__objectDepths[5] = -9999; // oWindowScaler
global.__objectDepths[6] = -100; // obj_Aura_Control
global.__objectDepths[7] = -100; // obj_Aura_Light_Parent
global.__objectDepths[8] = -110; // obj_Aura_ShadowCaster_Parent
global.__objectDepths[9] = -100; // obj_Aura_Point_Light
global.__objectDepths[10] = 0; // obj_Aura_Torch_Light
global.__objectDepths[11] = -200; // obj_Aura_Mouse_Light
global.__objectDepths[12] = -110; // obj_Aura_ShadowCaster_Box
global.__objectDepths[13] = -110; // obj_Aura_ShadowCaster_Rotate
global.__objectDepths[14] = -110; // obj_Aura_ShadowCaster_Circle
global.__objectDepths[15] = 0; // obj_Aura_ShadowCaster_Door
global.__objectDepths[16] = -300; // oParEntity
global.__objectDepths[17] = 0; // oParSolid
global.__objectDepths[18] = 0; // oParJumpThru
global.__objectDepths[19] = 0; // oParRail
global.__objectDepths[20] = 11; // oPlayer_TEST
global.__objectDepths[21] = -150; // oPlayer
global.__objectDepths[22] = 11; // oPlayer_OTHER
global.__objectDepths[23] = -150; // oFxExplode
global.__objectDepths[24] = -1; // oFxDust
global.__objectDepths[25] = 0; // oSensor
global.__objectDepths[26] = 0; // oFxShake
global.__objectDepths[27] = 0; // oBlock
global.__objectDepths[28] = 11; // oFloater
global.__objectDepths[29] = 0; // oMover
global.__objectDepths[30] = 0; // oSlopeR
global.__objectDepths[31] = 0; // oSlopeL
global.__objectDepths[32] = 0; // oSlopeR2
global.__objectDepths[33] = 0; // oSlopeL2
global.__objectDepths[34] = 0; // oRailMoverH
global.__objectDepths[35] = 0; // oRailMoverV
global.__objectDepths[36] = 0; // oCircleMover
global.__objectDepths[37] = 0; // oSwitchMoverH
global.__objectDepths[38] = 0; // oSwitchMoverV
global.__objectDepths[39] = 0; // oBounceMover
global.__objectDepths[40] = -200; // oJumpThru
global.__objectDepths[41] = 0; // oDoorV
global.__objectDepths[42] = 0; // oDoorH
global.__objectDepths[43] = 2; // oRailH
global.__objectDepths[44] = 2; // oRailV
global.__objectDepths[45] = 0; // oPixel
global.__objectDepths[46] = 0; // oPixelMaker
global.__objectDepths[47] = 0; // oPixelMakerFast
global.__objectDepths[48] = 0; // oRopeSpawner
global.__objectDepths[49] = 0; // oRopeSegment
global.__objectDepths[50] = 0; // oBridgeSpawner
global.__objectDepths[51] = 1; // oBridgePin
global.__objectDepths[52] = 1; // oBridgeSegment
global.__objectDepths[53] = 10; // oWaterMask
global.__objectDepths[54] = 10; // oShallowWaterMask
global.__objectDepths[55] = 1; // oWater
global.__objectDepths[56] = 0; // objSplash


global.__objectNames[0] = "oLevelGoal";
global.__objectNames[1] = "oGame";
global.__objectNames[2] = "oCamera";
global.__objectNames[3] = "oResolution";
global.__objectNames[4] = "oPlayerSpawner";
global.__objectNames[5] = "oWindowScaler";
global.__objectNames[6] = "obj_Aura_Control";
global.__objectNames[7] = "obj_Aura_Light_Parent";
global.__objectNames[8] = "obj_Aura_ShadowCaster_Parent";
global.__objectNames[9] = "obj_Aura_Point_Light";
global.__objectNames[10] = "obj_Aura_Torch_Light";
global.__objectNames[11] = "obj_Aura_Mouse_Light";
global.__objectNames[12] = "obj_Aura_ShadowCaster_Box";
global.__objectNames[13] = "obj_Aura_ShadowCaster_Rotate";
global.__objectNames[14] = "obj_Aura_ShadowCaster_Circle";
global.__objectNames[15] = "obj_Aura_ShadowCaster_Door";
global.__objectNames[16] = "oParEntity";
global.__objectNames[17] = "oParSolid";
global.__objectNames[18] = "oParJumpThru";
global.__objectNames[19] = "oParRail";
global.__objectNames[20] = "oPlayer_TEST";
global.__objectNames[21] = "oPlayer";
global.__objectNames[22] = "oPlayer_OTHER";
global.__objectNames[23] = "oFxExplode";
global.__objectNames[24] = "oFxDust";
global.__objectNames[25] = "oSensor";
global.__objectNames[26] = "oFxShake";
global.__objectNames[27] = "oBlock";
global.__objectNames[28] = "oFloater";
global.__objectNames[29] = "oMover";
global.__objectNames[30] = "oSlopeR";
global.__objectNames[31] = "oSlopeL";
global.__objectNames[32] = "oSlopeR2";
global.__objectNames[33] = "oSlopeL2";
global.__objectNames[34] = "oRailMoverH";
global.__objectNames[35] = "oRailMoverV";
global.__objectNames[36] = "oCircleMover";
global.__objectNames[37] = "oSwitchMoverH";
global.__objectNames[38] = "oSwitchMoverV";
global.__objectNames[39] = "oBounceMover";
global.__objectNames[40] = "oJumpThru";
global.__objectNames[41] = "oDoorV";
global.__objectNames[42] = "oDoorH";
global.__objectNames[43] = "oRailH";
global.__objectNames[44] = "oRailV";
global.__objectNames[45] = "oPixel";
global.__objectNames[46] = "oPixelMaker";
global.__objectNames[47] = "oPixelMakerFast";
global.__objectNames[48] = "oRopeSpawner";
global.__objectNames[49] = "oRopeSegment";
global.__objectNames[50] = "oBridgeSpawner";
global.__objectNames[51] = "oBridgePin";
global.__objectNames[52] = "oBridgeSegment";
global.__objectNames[53] = "oWaterMask";
global.__objectNames[54] = "oShallowWaterMask";
global.__objectNames[55] = "oWater";
global.__objectNames[56] = "objSplash";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for