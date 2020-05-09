/// GetSurvivalModeData();

waves   = buffer_read(buff, buffer_u8);     
players = buffer_read(buff, buffer_u8);

ds_list_clear(objectsToDraw);
for (var i = 0; i < players; i++) {
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_string)); // Player tag
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_s16));    // X position
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_s16));    // Y position
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_s16));    // Sprite index
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_s16));    // Image index
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_s8));     // Image xscale
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_u8));     // HP
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_u8));     // Max HP
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_string)); // Name
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_u8));     // ID
    ds_list_add(objectsToDraw, buffer_read(buff, buffer_u8));     // TeamID
}
