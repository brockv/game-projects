/// SendKey(key, value);

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, KEY);
buffer_write(buffer, buffer_s16, argument[0]);
buffer_write(buffer, buffer_s16, argument[1]);
network_send_packet(socket, buffer, buffer_tell(buffer));



