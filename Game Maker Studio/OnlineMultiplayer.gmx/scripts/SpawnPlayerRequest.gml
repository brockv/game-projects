/// SpawnPlayerRequest(team_id, name);

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, SPAWNPLAYER);
buffer_write(buffer, buffer_u8, argument[0]);
buffer_write(buffer, buffer_string, argument[1]);
network_send_packet(socket, buffer, buffer_tell(buffer));

