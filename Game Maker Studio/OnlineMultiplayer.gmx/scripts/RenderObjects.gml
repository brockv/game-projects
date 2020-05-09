/// RenderObjects();

var index = 0;

for (var i = 0; i < players; i++) {
    var xx, yy, spr_index, img_index, img_xscale, hp, name, tag, ID, teamID, alive;
    
    tag        = ds_list_find_value(objectsToDraw, index++);
    xx         = ds_list_find_value(objectsToDraw, index++);
    yy         = ds_list_find_value(objectsToDraw, index++);
    spr_index  = ds_list_find_value(objectsToDraw, index++);
    img_index  = ds_list_find_value(objectsToDraw, index++);
    img_xscale = ds_list_find_value(objectsToDraw, index++);
    hp         = ds_list_find_value(objectsToDraw, index++);
    maxHP      = ds_list_find_value(objectsToDraw, index++);
    name       = ds_list_find_value(objectsToDraw, index++);
    ID         = ds_list_find_value(objectsToDraw, index++);
    teamID     = ds_list_find_value(objectsToDraw, index++);
    
    
    draw_set_colour(c_white);
    switch (tag) {
        case ("player"):
            if (sprite_exists(spr_index)) {
               draw_sprite_ext(spr_index, img_index, xx, yy, img_xscale, 1, 0, c_white, 1);
               draw_set_halign(fa_center);
               // Highlight our name.
               if (myID == ID) {
                  draw_set_colour(c_yellow);
                  //draw_text(xx, yy - 30, name);
                  //audio_listener_position(xx, yy, 0);
               } else {
                  draw_set_colour(c_white);
               }
               if (hp > 0) {
                   draw_text(xx, yy - 30, name);
                   draw_set_halign(fa_left);
                   var currentHP = (hp / maxHP) * 100;
                   draw_healthbar(xx - 10, yy - 34, xx + 10, yy - 32, currentHP, c_black, c_red, c_lime, 0, true, true);
               } else {
                   draw_text(xx, yy - 30, deathMSG);
                   //draw_text(xx, yy - 48, name);
               }
               
            }
        
            draw_set_halign(fa_left);
            draw_set_colour(c_white);
            
        break;
        
        case ("bullet"):
             draw_sprite_ext(spr_index, img_index, xx, yy, img_xscale, 1, 0, c_white, 1);
        
        break;
        
        case ("monster"):
             draw_sprite_ext(spr_index, img_index, xx, yy, img_xscale, 1, 0, c_white, 1);
             var currentHP = (hp / maxHP) * 100;
             if (hp < maxHP) {
                draw_healthbar(xx - 10, yy - 19, xx + 10, yy - 17, currentHP, c_black, c_red, c_lime, 0, true, true);
             }
        
        break;
        
    }
}
