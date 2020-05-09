/// SendIDToClient(id, socket);

buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, MYID);
buffer_write(server_buffer, buffer_u8, argument[0]);
network_send_packet(argument[1], server_buffer, buffer_tell(server_buffer));
