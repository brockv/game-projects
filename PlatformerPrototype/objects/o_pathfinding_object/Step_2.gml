/// @description Movement logic

// Vertical
if (vsp != 0) {
    cy += vsp;
    var ivsp_ = floor(cy);
    cy -= ivsp_;
    repeat(abs(ivsp_)) {
        var svsp_ = sign(ivsp_);
        if (check_collision(0, svsp_)) {
            vsp = 0;
            break;
        } else {
            y += svsp_;
        }
    }
}

// Horizontal
if (hsp != 0) {
    cx += hsp;
    var ihsp_ = floor(cx);
    cx -= ihsp_;
    repeat(abs(ihsp_)) {
        var shsp_ = sign(ihsp_);
        if (check_collision(shsp_, 0)) {
            hsp = 0;
            break;
        } else {
            x += shsp_;
        }
    }
}




