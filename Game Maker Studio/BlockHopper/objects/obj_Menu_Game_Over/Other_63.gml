/// @description Opens *.ini File And Creates Score Tables

var time = (global.seconds + (global.minutes * 60) + (global.hours * 3600));
attempts = global.attempt_number;

//Listen For Async Dialog Event
var i_d = ds_map_find_value(async_load, "id");

//If The Dialog Is The One Where We Ask The Player For A Name
if i_d == global.submit_name
{
    //If The User Clicked "Ok"
    if ds_map_find_value(async_load, "status")
    {
        //Check If Input Is Greater Than 8 Characters OR Empty.
        //If The Name Entered Is Not Blank Or Too Long
        if (string_length(ds_map_find_value(async_load, "result")) > 8 || ds_map_find_value(async_load, "result") == "")
        {
            //Determine In What Way To Dislay The Correct Error Message.
            if (string_length(ds_map_find_value(async_load, "result")) > 8)
            {
                show_message_async("Name too long. Must be 8 characters or less.");
                global.submit_name = get_string_async("Enter your name:", "AAA");
            }
            
            if (ds_map_find_value(async_load, "result") == "")
            {
                show_message_async("No name entered!");
                global.submit_name = get_string_async("Enter your name:", "AAA");
            }
        }
        
        //If The Name Entered Is Not Blank Or Too Long
        else if(string_length(ds_map_find_value(async_load, "result")) <= 8 && ds_map_find_value(async_load, "result") != "")
        {
            //Get The Name Entered
            global.Name = ds_map_find_value(async_load, "result");
            
            //DETERMINE WHICH FILE TO OPEN, AND BUILD A HIGH SCORE TABLE
            //AIM OF THE GAME IS TO GET THE FASTEST TIME POSSIBLE
            //------------------------START--------------------
            //Open Correct "scores_.ini"
            if (global.difficulty_path = "Easy")
            {
                ini_open("scores_easy.ini");
            }
            else if (global.difficulty_path = "Medium")
            {
                ini_open("scores_medium.ini");
            }
            else if (global.difficulty_path = "Hard")
            {
                ini_open("scores_hard.ini");
            }
            
            for (i = 0; i < 5; i++)
            {
                //Fill The Global Scores Array With Values From The Ini File. If No Values Are Present, Then Fill With Name = "Unknown" And Time = "99999"
                global.score_array[i, 0] = ini_read_string(string(i), "Name", "Unknown");
                global.score_array[i, 1] = ini_read_real(string(i), "Time", 99999);
                global.score_array[i, 2] = ini_read_real(string(i), "Attempts", 500);
            }
            //Close *.ini File
            ini_close();
            
                                          
            //Search For First Spot Where Player's Score Is Greater
            for (i = 0; i < 5; i++)
            {
                //If The Player's Time Is Less Than The Spot In Question
                if (time < global.score_array[i, 1])
                {
                    //Starting At The Last Element Of The Array, Set Each Element To The One Before It.
                    for (j = 4; j > i; j--)
                    {
                        global.score_array[j, 0] = global.score_array[j - 1, 0];
                        global.score_array[j, 1] = global.score_array[j - 1, 1];
                        global.score_array[j, 2] = global.score_array[j - 1, 2];
                    }
                    
                    //Set The Space To That Of This Player
                    global.score_array[i, 0] = global.Name;
                    global.score_array[i, 1] = time;
                    global.score_array[i, 2] = attempts;
                    break;
                }
            }
            
            
            //Update *.ini With This Array
            if (global.difficulty_path = "Easy")
            {
                ini_open("scores_easy.ini");
            }
            else if (global.difficulty_path = "Medium")
            {
                ini_open("scores_medium.ini");
            }
            else if (global.difficulty_path = "Hard")
            {
                ini_open("scores_hard.ini");
            }
            for (i = 0; i < 5; i++)
            {
                ini_write_string(string(i), "Name", global.score_array[i, 0]);
                ini_write_real(string(i), "Time", global.score_array[i, 1]);
                ini_write_real(string(i), "Attempts", global.score_array[i, 2]);
            }
            
            //Close *.ini File
            ini_close();
            
            //Go To High Score Room
            global.next_room = room_Score_Display;
            instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), obj_Menu_Fade);
            //room_goto(room_Score_Display);
        }
    }

}

