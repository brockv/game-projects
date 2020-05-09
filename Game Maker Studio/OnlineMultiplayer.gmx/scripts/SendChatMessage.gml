/// SendChatMessage(name, msg);

buffer_seek(buffer, buffer_seek_start, 0); 

buffer_write(buffer, buffer_u8, CHAT) ; 
buffer_write(buffer, buffer_string, argument[0]); 
buffer_write(buffer, buffer_string, argument[1]); 
network_send_packet(socket, buffer, buffer_tell(buffer)); 
