/// @description JUST a parent object to check if a menu is open
/*
 This object is used in the 'pause_handler' object to check if the game is paused,
 and to make sure that if we close a menu we dont also close the pause menu, while the game is still paused
 */

// View dimensions used for drawing menu options
vw_ = camera_get_view_width(view_camera[0]);
vh_ = camera_get_view_height(view_camera[0]);