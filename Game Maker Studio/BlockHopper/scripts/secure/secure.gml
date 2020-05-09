/// @description secure(string);
/// @param string
var ret = "";

// replace all characters with asterixis
for (i = 0; i < string_length(argument0); i++) {
    ret += "*";
}

// if string is empty, return plaintext "password"
if (ret == "") {
    return "password";
}

return ret; // return a censored string
