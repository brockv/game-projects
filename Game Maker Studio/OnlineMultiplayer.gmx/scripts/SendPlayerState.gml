/// SendPlayerState(socket, state);

var server_buffer = oServer.server_buffer

buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, PLAYERSTATE);
buffer_write(server_buffer, buffer_u8, argument[1]);
network_send_packet(argument[0], server_buffer, buffer_tell(server_buffer));
