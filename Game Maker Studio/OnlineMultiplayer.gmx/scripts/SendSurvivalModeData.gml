/// SendSurvivalModeData();

buffer_seek(player_buffer, buffer_seek_start, 0);
buffer_write(player_buffer, buffer_u8, PLAYERBUFFER);
buffer_write(player_buffer, buffer_u8, waves);
var objectsToDraw = instance_number(oPlayer) + instance_number(oParProjectile) + instance_number(oParEnemy);
buffer_write(player_buffer, buffer_u8, objectsToDraw);

global.player_buffer = player_buffer;


with(oPlayer) {
   buffer_write(global.player_buffer, buffer_string, "player");
   buffer_write(global.player_buffer, buffer_s16, x);
   buffer_write(global.player_buffer, buffer_s16, y);
   buffer_write(global.player_buffer, buffer_s16, sprite_index);
   buffer_write(global.player_buffer, buffer_s16, image_index);
   buffer_write(global.player_buffer, buffer_s8, image_xscale);
   buffer_write(global.player_buffer, buffer_u8, hp);
   buffer_write(global.player_buffer, buffer_u8, maxHP);
   buffer_write(global.player_buffer, buffer_string, name);
   buffer_write(global.player_buffer, buffer_u8, ID);    
   buffer_write(global.player_buffer, buffer_u8, teamID);         
}


with(oParProjectile) {
   buffer_write(global.player_buffer, buffer_string, "bullet");
   buffer_write(global.player_buffer, buffer_s16, x);
   buffer_write(global.player_buffer, buffer_s16, y);
   buffer_write(global.player_buffer, buffer_s16, sprite_index);
   buffer_write(global.player_buffer, buffer_s16, image_index);
   buffer_write(global.player_buffer, buffer_s8, image_xscale);
   buffer_write(global.player_buffer, buffer_u8, 0);
   buffer_write(global.player_buffer, buffer_u8, 0);
   buffer_write(global.player_buffer, buffer_string, "");
   buffer_write(global.player_buffer, buffer_u8, ID);    
   buffer_write(global.player_buffer, buffer_u8, 0);        
}

with(oParEnemy) {
   buffer_write(global.player_buffer, buffer_string, "monster");
   buffer_write(global.player_buffer, buffer_s16, x);
   buffer_write(global.player_buffer, buffer_s16, y);
   buffer_write(global.player_buffer, buffer_s16, sprite_index);
   buffer_write(global.player_buffer, buffer_s16, image_index);
   buffer_write(global.player_buffer, buffer_s8, image_xscale);
   buffer_write(global.player_buffer, buffer_u8, hp);
   buffer_write(global.player_buffer, buffer_u8, maxHP);
   buffer_write(global.player_buffer, buffer_string, "");
   buffer_write(global.player_buffer, buffer_u8, 0);    
   buffer_write(global.player_buffer, buffer_u8, 0);        
}

for (var s = 0; s < ds_list_size(sockets); s++) {
    var currentSocket = ds_list_find_value(sockets, s);
    
    network_send_packet(currentSocket, player_buffer, buffer_tell(player_buffer));
}
