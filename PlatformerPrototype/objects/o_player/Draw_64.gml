/// @description Draw light gauge

var _w = view_width - (view_width / 2);

draw_healthbar(_w - effect_shine_max_timer_/2,
				5, 
			   _w + effect_shine_max_timer_,
			   15, ((effect_shine_timer_ - 64) * 100) / effect_shine_max_timer_,
			   c_black, c_white, c_white, 0, false, false);
