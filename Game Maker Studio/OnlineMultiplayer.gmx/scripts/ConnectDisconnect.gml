/// ConnectDisconnect();

// Someone is trying to connect / disconnect
var type = ds_map_find_value(async_load, "type");
var sock = ds_map_find_value(async_load, "socket");

switch (type) {
    case (network_type_connect):
    
       ds_list_add(sockets, sock);
       ds_map_add(clients, sock, noone);
       //SendIDToClient(sock, sock);
    
    break;
       
    case (network_type_disconnect):
    
       var index = ds_list_find_index(sockets, sock);
       ds_list_delete(sockets, index);
       
       var players = ds_map_find_value(clients, sock);
       
       if (players != noone) {
          if (instance_exists(players)) {
             with (players) {
                  instance_destroy();
             }
          }
       }
       
       ds_map_delete(clients, sock);
       
    break;
}
