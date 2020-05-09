/// LoadSettings();

// Load settings from file

ini_open("config.ini");

ini_write_string("GAME_STUFF", "IDK", "I don't know");

global.serverPort     = ini_read_real("SERVER_OPTIONS", "server_port", 50000);
global.clientPort     = ini_read_real("CLIENT_OPTIONS", "client_port", 50000);
global.ip             = ini_read_string("CLIENT_OPTIONS", "client_ip", "127.0.0.1");
global.externalIP     = ini_read_string("SERVER_OPTIONS", "server_ip", "");
global.maxClients     = ini_read_real("SERVER_OPTIONS", "max_clients", 4);
global.playerName     = ini_read_string("PROFILE_OPTIONS", "player_name", "Guest");
global.serverName     = ini_read_string("SERVER_OPTIONS", "server_name", "Server");
global.displayWidth   = ini_read_real("GAME_SETTINGS", "window_width", 1024);
global.displayHeight  = ini_read_real("GAME_SETTINGS", "window_height", 768);

ini_close();
