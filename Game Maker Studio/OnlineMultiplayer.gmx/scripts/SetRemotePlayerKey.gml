/// SetRemotePlayerKey(playerID, key, value);

var player = noone;

for (var i = 0; i < instance_number(oRemotePlayer); i++) {
    var _player = instance_find(oRemotePlayer, i);
    
    if (_player.ownerID == argument[0]) {
       player = _player;
       break;
    }
}

if (player != noone) {
   player.keys[argument[1]] = argument[2];
}
