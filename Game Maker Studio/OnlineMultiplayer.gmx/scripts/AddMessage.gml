/// AddMessage(name, msg);

var n  = argument[0];
var mg = argument[1];

if (ds_list_size(senders) < maxChatMessages) {
   ds_list_add(senders, n);
   ds_list_add(messages, mg);
} else {
   for (var m = 0; m < ds_list_size(senders); m++) {
       if (m < ds_list_size(senders) - 1) {
          ds_list_replace(senders, m, ds_list_find_value(senders, m + 1));
          ds_list_replace(messages, m, ds_list_find_value(messages, m + 1));
       } else {
          ds_list_replace(senders, m, n);
          ds_list_replace(messages, m, mg);
       }
   }
}
