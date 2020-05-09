/// @description resolution_get_default()

// This script chooses a default windowed resolution -- (from the list of supported resolutions) -- that best fits the user's display

//switch(display_width_) {
//    case 1280: {
//        switch(display_height_) {
//            case 720:  current_resolution_id_ = 1; break;
//            case 960:  current_resolution_id_ = 2; break;
//            default:   current_resolution_id_ = 0; break;
//        }
//        break;
//    }
	
//	case 1440: {
//		switch(display_height_) {
//            case 900:  current_resolution_id_ = 3; break;
//            default:   current_resolution_id_ = 3; break;
//        }
//        break;
//	}	
//    case 1600: {
//        switch(display_height_) {
//            case 900:  current_resolution_id_ = 3; break;
//            default:   current_resolution_id_ = 3; break;
//        }
//        break;
//    }
//    default:   current_resolution_id_ = 0; break;
//}

current_width_ = resolution_list_[global.resolution_id_, 0];
current_height_ = resolution_list_[global.resolution_id_, 1];