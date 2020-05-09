/// SendSound(socket, soundid, x, y, z);

buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, SOUND);
buffer_write(server_buffer, buffer_s16, argument[1]); // Sound ID
buffer_write(server_buffer, buffer_s16, argument[2]); // X position
buffer_write(server_buffer, buffer_s16, argument[3]); // Y position
buffer_write(server_buffer, buffer_s16, argument[4]); // Z position
network_send_packet(argument[0], server_buffer, buffer_tell(server_buffer));
