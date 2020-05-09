/// CreateNetworkObject(socket, ownerID, teamID, x, y, hspeed, vspeed, object, remoteID);

buffer_seek(player_buffer, buffer_seek_start, 0);
buffer_write(player_buffer, buffer_u8, CREATENO);

buffer_write(player_buffer, buffer_u16, argument[8]);
buffer_write(player_buffer, buffer_u16, argument[1]); // Owner ID
buffer_write(player_buffer, buffer_s16, argument[2]); // Team ID

buffer_write(player_buffer, buffer_s16, argument[3]); // X position
buffer_write(player_buffer, buffer_s16, argument[4]); // Y position

buffer_write(player_buffer, buffer_s16, argument[5]); // Hspeed
buffer_write(player_buffer, buffer_s16, argument[6]); // Vspeed

buffer_write(player_buffer, buffer_s16, argument[7]); // Object

network_send_packet(argument[0], player_buffer, buffer_tell(player_buffer));


