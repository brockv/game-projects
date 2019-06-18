///@description ini_save(file_name);
///@arg file_name

// Assign the argument and open the file associated with it
var _file_name = argument[0];
ini_open(_file_name);

// Write to the file
ini_write_real("Level Unlocked:", "level_unlocked", global.level_unlocked_);
ini_write_real("Music Volume:", "music_volume", global.music_volume_);
ini_write_real("Effects Volume:", "effects_volume", global.effects_volume_);
ini_write_real("Background Color Button:", "background_color_button", global.background_color_button_);
ini_write_real("Background Color:", "background_color", global.background_color_);
ini_write_real("Resolution ID:", "resolution_id", global.resolution_id_);

// Close the file
ini_close();