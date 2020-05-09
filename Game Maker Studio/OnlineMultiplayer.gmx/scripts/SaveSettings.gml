/// SaveSettings();

// Save settings to file

if (file_exists("config.ini")) {
    ini_open("config.ini");
    
    ini_write_string("GAME_STUFF", "IDK", "I don't know");
    
    ini_write_real("SERVER_OPTIONS", "server_port", global.serverPort);
    ini_write_real("CLIENT_OPTIONS", "client_port", global.clientPort);
    ini_write_string("CLIENT_OPTIONS", "client_ip", global.ip);
    ini_write_string("SERVER_OPTIONS", "server_ip", global.externalIP);
    ini_write_real("SERVER_OPTIONS", "max_clients", global.maxClients);
    ini_write_string("PROFILE_OPTIONS", "player_name", global.playerName);
    ini_write_string("SERVER_OPTIONS", "server_name", global.serverName);
    ini_write_real("GAME_SETTINGS", "window_width", global.displayWidth);
    ini_write_real("GAME_SETTINGS", "window_height", global.displayHeight);
    
    ini_close();

}
