/// @description Draw the credits

// Room title
draw_set_font(f_large);
draw_text(gui_width_ / 2, 60, "CREDITS");
draw_text(gui_width_ / 2, 90, "----------");

// Music credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, 200, "Music by:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, 240, "Eric Matyas");
draw_text(gui_width_ / 2, 290, "www.soundimage.org");

// Font credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, 410, "Font used:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, 450, "PixelSplitter");
draw_text(gui_width_ / 2, 490, "https://www.dafont.com/font-comment.php?file=pixelsplitter");

// Font credits
draw_set_font(f_selected);
draw_text(gui_width_ / 2, 610, "Created by:");
draw_set_font(f_main);
draw_text(gui_width_ / 2, 650, "Brock Vance");
draw_text(gui_width_ / 2, 690, "Done as a personal project over winter break");
