/// RemotePlayerKey(socket, playerID, key, state);

buffer_seek(player_buffer, buffer_seek_start, 0);
buffer_write(player_buffer, buffer_u8, REMOTEPK);
buffer_write(player_buffer, buffer_u8, argument[1]);
buffer_write(player_buffer, buffer_s16, argument[2]);
buffer_write(player_buffer, buffer_u8, argument[3]);
network_send_packet(argument[0], player_buffer, buffer_tell(player_buffer));
