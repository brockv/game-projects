/// SendChatToClients(socket, sender, message);

buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, SERVERCHAT);
buffer_write(server_buffer, buffer_string, argument[1]);
buffer_write(server_buffer, buffer_string, argument[2]);
network_send_packet(argument[0], server_buffer, buffer_tell(server_buffer));
