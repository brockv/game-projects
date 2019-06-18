xx = mouse_x //gives coordinates of your click
grab = 1

//click on a currently selected item.
if (rotating = 0) {
	if (device_mouse_x_to_gui(0) > cx - 37) { //coordinates of the biggest subimage
		if (device_mouse_x_to_gui(0) < cx + 37) {
			if (device_mouse_y_to_gui(0) > cy) {
				if (device_mouse_y_to_gui(0) < cy + 100) {
					grab = 0;
					xx = 0;
					switch (button_) {
						case 0: show_message("You selected POTION"); break;
						case 1: show_message("You selected ETHER"); break;
						case 2: show_message("You selected ELIXIR"); break;
						case 3: show_message("You selected REMEDY"); break;
						case 4: show_message("You selected ANTIDOTE"); break;
					}
				}
			}
		}
	}
}