/// @description Draw sprite

//// Draw burst particles
//for (var i = amount; i > 0; i--) {
//	// Move particles
//	xx[i]	 += xspd[i];
//	yy[i]	 -= yspd[i];
//	rot[i]	 += rot_dir[i];
//	alpha[i] -= 0.05;
	
//	// Draw particles
//	draw_sprite_ext(sprite[i], 0, xx[i], yy[i], 1, 1, rot[i], c_white, alpha[i]);
	
//	// Destroy the particle when the alpha is less than or equal to zero
//	if (alpha[i] <= 0) instance_destroy();
//}