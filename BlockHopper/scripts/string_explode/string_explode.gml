/// @description string_explode(string,explode);
/// @param string
/// @param explode
var str = argument0;
var explode = argument1;

var count = string_count(explode, str);

for (var i = 0; i < count; i++) {
    var pos = string_pos(explode, str);
    mapData[i] = string_copy(str, 1, pos - 1);
    str = string_delete(str, 1, pos);
}
