var base_w = 738;
var base_h = 384;
var aspect = display_get_width() / display_get_height();

if (aspect > 1)
{
    //Landscape
    display_set_gui_size(base_h * aspect, base_h);
}
else
{
    //Portrait
    display_set_gui_size(base_w, base_w / aspect);
}
