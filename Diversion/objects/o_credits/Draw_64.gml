/// @description Draw the credits

// Room title
draw_set_font(f_large);
draw_text(gui_width_ / 2, 60, "CREDITS");
draw_text(gui_width_ / 2, 90, "----------");

// Music credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, music_y_offset_, "Music by:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, music_y_offset_ + 40, "Eric Matyas");
draw_text(gui_width_ / 2, music_y_offset_ + 80, "www.soundimage.org");

// Font credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, font_y_offset_, "Font used:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, font_y_offset_ + 40, "PixelSplitter");
draw_text(gui_width_ / 2, font_y_offset_ + 80, "https://www.dafont.com/font-comment.php?file=pixelsplitter");

// Font credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, creator_y_offset_, "Created by:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, creator_y_offset_ + 40, "Brock Vance");
draw_text(gui_width_ / 2, creator_y_offset_ + 80, "Done as a personal project over winter break");
