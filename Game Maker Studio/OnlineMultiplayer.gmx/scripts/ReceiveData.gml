///ReceiveData()
 
var sock         = ds_map_find_value(async_load,"id") ; 
var receive_buff = ds_map_find_value(async_load,"buffer") ; 

var cmd = buffer_read(receive_buff,buffer_u8) ; 

switch (cmd) {
    case (SERVERMODE):
       SendServerMode(sockets);
    
    break;
    
    case (SPAWNPLAYER):
    
       // Destroy dead player objects
       for (var i = 0; i < instance_number(oPlayer); i++) {
           var tempPlayer = instance_find(oPlayer, i);
           
           if (tempPlayer.ID == sock) {
               with (tempPlayer) {
                    instance_destroy()
               }
               
               break;
           }
       }
       
       // Create a Player    
       var playersID   = buffer_read(receive_buff, buffer_u8);
       var playersName = buffer_read(receive_buff, buffer_string);
       
       var player = instance_create(32 + (random(room_width - 64)), room_height / 2, oPlayer);
       player.ID  = sock;
       if (global.serverType == TDM) {
          player.teamID = playersID
       } else {
          player.teamID = sock;
       }
       
       player.hp     = 100;
       player.name   = playersName;
       player.kills  = kills[player.ID];
       player.deaths = deaths[player.ID];
       SendIDToClient(sock, sock);
       ds_map_replace(clients, sock, player);
    
    break;
    
    
    case (NAME):
       var name    = buffer_read(receive_buff, buffer_string);
       var players = ds_map_find_value(clients, sockets);
       
       if (players != noone) {
          if (instance_exists(players)) {
             players.name = name;
          }
       }
       
    break;
    
    case (KEY):
       globalvar key, value;
       key   = buffer_read(receive_buff, buffer_s16);
       value = buffer_read(receive_buff, buffer_s16);
       
       var playerSending = ds_map_find_value(clients, sock);
       if (playerSending != noone) {
          if (instance_exists(playerSending)) {
             with (playerSending) {
                  keys[key] = value;
             }
          }
       }
    
    break;


    case (CHAT):
         var sender = buffer_read(receive_buff, buffer_string); 
         var msg    = buffer_read(receive_buff, buffer_string); 
         
         // Send the sender name and message to other clients
         for (var i = 0; i < ds_list_size(sockets); i++) {
             var currentSocket = ds_list_find_value(sockets, i); 
        
             SendChatToClients(currentSocket, sender, msg); 
         }
    
    break;

}

