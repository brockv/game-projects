/// SendServerMode(socket);

buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, SERVERMODE);
buffer_write(server_buffer, buffer_u8, global.serverType);
buffer_write(server_buffer, buffer_u8, global.friendlyDamage);
buffer_write(server_buffer, buffer_u8, waves);
network_send_packet(argument[0], server_buffer, buffer_tell(server_buffer));
