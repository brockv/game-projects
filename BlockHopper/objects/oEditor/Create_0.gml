/// @description README
/*

======================================================================
WHAT YOU WILL NEED
======================================================================

1. Access to a database
2. Webhosting

======================================================================
SETTING UP A DATABASE
======================================================================
I use HostGator for both my database and hosting needs. While I am
not instructing you to use them as well, I will be creating a database
using their website as a model for the steps that need to be taken.
For the most part, the creation process will be the same. Most web hosts
have cPanels and mySQL/phpMyAdmin access.

1. Log in to your account.
2. Find your way to the customer portal/control panel (cPanel).
3. Look for the area containing "Hosting"/mySQL/phpMyAdmin/"Dadabases".
4. Click "Create a New Database".
5. You will be taken through the process of setting up your database.
    - Give it a name, like "editor" or something along those lines.
6. Create/assign a user to have access to your database. This requires
    a name and a password.
7. Go back to your cPanel and locate phpMyAdmin. Log in with the
    user you just created
8. On the left side there should be your database. Click to expand it
    and press "New". We are going to add tables.
9. You are going to want to create one table with six columns
    of the following types:

[FORMAT: name, type, collation, attributes, default, extra]
map, text, utf8_unicode_ci, , no, none, ,
name, text, utf8_unicode_ci, , no, none, ,
author, text, utf8_unicode_ci, , no, none, ,
id, varchar(64), utf8_unicode_ci, , no, none, ,
time_stamp, int(11), , , no, none, ,
password, varchar(64), utf8_unicode_ci, , no, none, ,

10. Mark table "id" as unique. This is important as no two levels
    can share the name ID.

Congratulations! Your database is set up! Get familiar with how mySQL
works. There are countless tutorials and informatives online. It is
recommended you know how to drop/truncate tables.

======================================================================
WEBHOSTING / USING AN FTP
======================================================================
Next, we want to upload two files to our host: post.php and pull.php.
This allows us to communicate with our database to post and pull
information. The two files are found below. The only changes they
require are you to replace db_user with your database username,
db_password with your database password, and db_name with your database
name. localhost is typically the host you will connect to, if this
is not the case, your webhost should have the information in the
cPanel.

To upload files to your website, many webhosts require an FTP.
If your host comes with a file uploader, ignore connecting to your
website via an FTP and simply upload the post and pull files.

Ensure the files are saved with the .php extension. NotePad++ is a
great text editor that is free and can save with the .php extension.

I use FileZilla as my FTP. Simply log in with your website
login (address, username, password, etc.) and upload the two files to
a specific directory.

** NOTE THIS DIRECTORY IN THE CREATE EVENT OF oEditor as BASEURL**

Other than that, you are good to go! The code is ocmmented and can be
changed as necessary. If you have any questions, feel free to contact
me.

Zack Banack
http://zackbanack.com/
zbanack@gmail.com

June 2, 2015.

DO NOT REDISTRIBUTE THIS SOURCE FILE WITH OR WITHOUT MODIFICATIONS

NOTE, THIS EXAMPLE CONNECTS TO MY DATABASE. I HAVE THE RIGHT TO REMOVE
ANY DATA SENT. DO NOT USE MY WEBSITE TO HOST YOUR THE CONTENT FOR
YOUR GAME/APPLICATION. IT *WILL* BE TAKEN DOWN.

======================================================================
post.php
======================================================================
<?php
// establish connection
$con = mysqli_connect("localhost","db_user","dp_password","db_name");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$map = $_GET["map"]; // get the map from the URL
$author = urldecode($_GET["author"]); // get the author from the URL
$name = urldecode($_GET["name"]); // get the name from the URL
$id = urldecode($_GET["id"]); // get the ID from the URL
$verify = urldecode($_GET["verify"]); // get the verification (auth) from the URL
$password = urldecode($_GET["password"]); // get the password from the URL
$time_stamp = $_SERVER['REQUEST_TIME']; // get the timestamp from the URL

$salt = "mysalt123"; // THIS MUST MATCH WHAT YOU PUT AS SALT IN GAME MAKER
$getPassword = ""; // will be used to grab the password

// values to update - replace "Level" with name of your table
$sql = "REPLACE INTO Level (map, author, name, time_stamp, password, id)
VALUES ('$map','$author','$name','$time_stamp','$password','$id')";

$encoded = md5( mb_convert_encoding($map.$salt, "UTF-8" )); // encode, just like in Game Maker

$result = mysqli_query($con,"SELECT * FROM Level where id = '$id'") or die(mysqli_error($con)); // get the level based on ID

$map = urldecode($map); // encode the map
// retrieve values
if ($result!=""){ 
  while($row = mysqli_fetch_array($result)){
    $getPassword = $row['password']; // get the password
  }
}

$pass = true; // test if the passwords match, if there is a need to check
$update = false; // whether or not to update

if (strlen($getPassword)>0){ // if the password exists
  if (strcmp($password, $getPassword) != 0){ // if they are not the same
    $pass = false;
  } 
  else{
    $pass = true;
    $update = true;
  }
}

$success = "";

if ($pass == true){ // if the passwords match, or if the level is new
  if (strcmp($verify, $encoded) == 0) { // if the verification is correct
    if ($con->query($sql) === TRUE) { // if we are connected to the database
      if ($update == false && strlen($password)>0){ // if we are not updating
        $success = "1"; // level uploaded
      }
      else{
        $success = "4"; // level updated
      }
    } else {
      $success = "0"; // not connected
    }
  }
  else{
    $success = "2"; // bad auth
  }
}
else{
  $success = "3"; // level not updated
}

echo $success; // print the message

mysqli_close($con); // close connection
?>

======================================================================
pull.php
======================================================================
<?php
// establish connection
$con = mysqli_connect("localhost","db_user","dp_password","db_name");

// check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

// pull from url
$Type = $_GET["Type"]; // get the search type from the url
$Search = $_GET["Search"]; // get the search string from the url
$password = $_GET["Password"]; // get the password from the url
$Push = urldecode($_GET["push"]); // get the push from the url - whether or not if are grabbing the level data to update
$getPassword = ""; // the password
$result = ""; // the result

// pull different results based on type - newest to oldest, ABC order, by first letter, by string, by exact match
// NOTE: change limit x to how many entries you would like to pull from the database
switch($Type){
case("1"): $result = mysqli_query($con,"SELECT * FROM Level ORDER BY time_stamp DESC limit 20") or die(mysqli_error($con)); break;
case("2"): $result = mysqli_query($con,"SELECT * FROM Level ORDER BY name ASC limit 20") or die(mysqli_error($con)); break;
case("3"): $result = mysqli_query($con,"SELECT * FROM Level WHERE LEFT(name, 1) = '$Search' limit 20") or die(mysqli_error($con)); break;
case("4"): $result = mysqli_query($con,"SELECT * FROM Level where name LIKE '%$Search%' or author LIKE '%$Search%' limit 20") or die(mysqli_error($con)); break;
case("5"): $result = mysqli_query($con,"SELECT * FROM Level where id = '$Search' limit 20") or die(mysqli_error($con)); break;
}


// retrieve values
if ($result!=""){
while($row = mysqli_fetch_array($result)){
$Res[0] = $row['map']; // get the map
$Res[1] = $row['name']; // get the name
$Res[2] = $row['author']; // get the author
$Res[3] = $row['time_stamp']; // get the timestamp
if ($Type == "5"){
$getPassword = $row['password'];
}

if ($Push == "0"){
  if (strlen($getPassword)>0 && strcmp($password, $getPassword) == 0){
    echo $Res[0]; // echo the map if the passwords match
  }
  else{ // echo zero
    echo "0";
  }
}
else{ // print the formatted text
echo "<level><map>".$Res[0]."</map><br><name>".urlencode($Res[1])."</name><br><author>".urlencode($Res[2])."</author><br><date>".$Res[3]."</date><br></level>";
}

}
}

mysqli_close($con); // close connection
?>

*/

/* */
// specify the URL directory which the game should point (where our post.php and pull.php files are)
BASEURL = "http://zackbanack.com/online";
salt = "mysalt123"; // a random phrase used for hashing - MAKE IT UNIQUE AND KEEP IT SECRET!!!
// BE SURE THIS SALT MATCHES THE ONES FOUND IN THE post.php AND pull.php FILES


window_set_cursor(cr_default);

for(i=0;i<31000;i++){
pos[i] = "";
}

mode = 0; // which mode our level editor/player is currently in
spacing = 32; // width of grid (object size)

// padding on the size of the level editor (value multiplied by spacing)
padding_left = 1; // left
padding_right = 1; // right
padding_top = 1; // top
padding_bottom = 2; // bottom

border = 2; // purely aesthetic, space padding between each grid piece

object[0] = ""; // empty array for objects
sprite[0] = ""; // empty array for sprites

counter = 0; // keep track of how many objects are in the editor

// horizontal and vertical grid sizes
horSize = (__view_get( e__VW.WView, 0 ) / spacing) - padding_right - padding_left;
vertSize = (__view_get( e__VW.HView, 0 ) / spacing) - padding_top - padding_bottom;

/* call the script add_obj followed by an object you want to incorporate into
the level editor and a (typically static) sprite to represent it. 

the third argument is the max number of said objects that can appear in the level.
set the value to -1 for an unlimited amount. typically, this argument would
be useful for ensuring that there are no more than 1 player objects present in the level.

the fourth argument is the minimum number of said objects that can appear in the level.
set the value to -1 for no minimum. typically, this argument would
be useful for ensuring that there is at least 1 "objective" object present in the room.

sprites should have an origin of (0,0) and be the size of the spacing variable */

add_obj(obj_Player, spr_PlayerLE, 1, 1); // add the player
add_obj(obj_Wall_One, spr_Block_One, -1, -1); // add the wall
add_obj(obj_Checkpoint, spr_Checkpoint, -1, -1); // add the key
add_obj(obj_Spike_Floor, spr_Spike_Up, -1, -1); // add the door
add_obj(obj_End_Path, spr_End_Path, -1, 1); // add the exit

clearMap(); // spawn/clear the map

loadedCount = 0; // how many levels have been loaded
resetResults(); // reset loaded level results from database
resultsLoaded = false; // whether or not our results have loaded

presswait = 0; // length of time between presses so modes are switched are a proper rate

emptied = 0; // items left to display in HUD from horizontal switching
locked = false; // whether or not the HUD is locked (can move left or right)

symbolOpen = chr(60); // open angled bracket
symbolClose = chr(62); // closed angeled bracket
symbolSlash = chr(47); // forward slash

loaded = false; // request from server, not to be confused with resultsLoaded, in which they are presentable

// array to hold map data
for (i = 0; i < horSize * vertSize; i++) {
    mapData[i] = "0";
}

ableSearch = true; // ability to search for a level from database

fetchData = http_get("");
fetchEdit = http_get("");
get = http_get("");

curEdit = 0; // level currently editing

MAXLENGTH = 24; // max length of text-editable string
editing = false; // whether or not a level is being edited
global.TESTING = false; // synonymous with "editing", but indicated whether or not a level is for playing (loaded) or editing

selectedLetter = false; // for searching, which letter we search by
letter = "A"; // letter to search by, capital

validString = false; // whether or not the string we searched is valid - validity is not empty
searchString = ""; // the string we are searching for

loadProcess = 0; // process of loading a level from online to rendering it in the game - 3 part process

global.textActive = false; // whether or not a text field is active

holdPass = ""; // a variable to hold a copy of the password

/* */
/*  */
