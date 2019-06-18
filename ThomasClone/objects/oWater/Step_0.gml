/// @description  Update.

if (move) {
    y += moveSpd;
    liquidheight -= moveSpd;
    
    // Change collision box
    image_yscale = liquidheight / sprite_get_height(sprite_index);
}
    
liquid_update(id);

