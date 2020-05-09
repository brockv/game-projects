///@description Provides a lookup table for the player's sprites

#region Move Sprite Table
// Sprite move lookup table
sprite_[player.move, dir.up] = s_player_run_up;
sprite_[player.move, dir.down] = s_player_run_down;
sprite_[player.move, dir.left] = s_player_run_right;
sprite_[player.move, dir.right] = s_player_run_right;
#endregion

#region Sword Sprite Table
// Sprite sword lookup table
sprite_[player.sword, dir.up] = s_player_attack_up;
sprite_[player.sword, dir.down] = s_player_attack_down;
sprite_[player.sword, dir.left] = s_player_attack_right;
sprite_[player.sword, dir.right] = s_player_attack_right;
#endregion

#region Evade Sprites
// Sprite evade lookup table
sprite_[player.evade, dir.up] = s_player_roll_up;
sprite_[player.evade, dir.down] = s_player_roll_down;
sprite_[player.evade, dir.left] = s_player_roll_right;
sprite_[player.evade, dir.right] = s_player_roll_right;
#endregion

#region Bomb Sprites
// Sprite bomb lookup table
sprite_[player.bomb, dir.up] = s_player_run_up;
sprite_[player.bomb, dir.down] = s_player_run_down;
sprite_[player.bomb, dir.left] = s_player_run_right;
sprite_[player.bomb, dir.right] = s_player_run_right;
#endregion

#region Found Item Sprites
// Sprite found_item lookup table
sprite_[player.found_item, dir.up] = s_player_found_item;
sprite_[player.found_item, dir.down] = s_player_found_item;
sprite_[player.found_item, dir.left] = s_player_found_item;
sprite_[player.found_item, dir.right] = s_player_found_item;
#endregion

#region Hit Sprites
// Sprite hit lookup table
sprite_[player.hit, dir.up] = s_player_run_up;
sprite_[player.hit, dir.down] = s_player_run_down;
sprite_[player.hit, dir.left] = s_player_run_right;
sprite_[player.hit, dir.right] = s_player_run_right;
#endregion

#region Dash Sprites
// Sprite dash lookup table
sprite_[player.dash, dir.up] = s_player_run_up;
sprite_[player.dash, dir.down] = s_player_run_down;
sprite_[player.dash, dir.left] = s_player_run_right;
sprite_[player.dash, dir.right] = s_player_run_right;
#endregion

#region Sword Hold Sprites
// Sprite sword_hold lookup table
sprite_[player.sword_hold, dir.up] = s_player_attack_up;
sprite_[player.sword_hold, dir.down] = s_player_attack_down;
sprite_[player.sword_hold, dir.left] = s_player_attack_right;
sprite_[player.sword_hold, dir.right] = s_player_attack_right;
#endregion

#region Sword Charged Attack Sprites
// Sprite sword_charged_attack lookup table
sprite_[player.sword_charged_attack, dir.up] = s_player_attack_up;
sprite_[player.sword_charged_attack, dir.down] = s_player_attack_down;
sprite_[player.sword_charged_attack, dir.left] = s_player_attack_right;
sprite_[player.sword_charged_attack, dir.right] = s_player_attack_right;
#endregion