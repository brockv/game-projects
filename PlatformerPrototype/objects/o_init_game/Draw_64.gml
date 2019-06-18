/// @description Draw FPS

// Calculate FPS and handle the timer
fps_timer -= 1; //Reduce timer
if (fps_timer <= 0 ) {
	fps_amout = fps_real; // Update FPS
	fps_timer = 30;		  // Reset FPS timer
}

// Draw FPS
draw_text(20, 20, "FPS: " + string(round(fps_amout)));