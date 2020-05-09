///@description ini_load(file_name);
///@arg file_name

// Assign the argument and open the file associated with it
var _file_name = argument[0];
ini_open(_file_name);

// Read from the file
global.level_unlocked_			= ini_read_real("Level Unlocked:", "level_unlocked", 1);
global.music_volume_			= ini_read_real("Music Volume:", "music_volume", 0.5);
global.effects_volume_			= ini_read_real("Effects Volume", "effects_volume", 0.5);
global.background_color_button_ = ini_read_real("Background Color Button:", "background_color_button", 2);
global.background_color_		= ini_read_real("Background Color:", "background_color", make_color_rgb(52, 51, 75));
global.resolution_id_			= ini_read_real("Resolution ID:", "resolution_id", 0);

// Close the file
ini_close();
