///@description How to use GUI over screen

// Just draw normally if you want the GUI in front of the CRT
// If you want a high-res GUI, use the following in a "Room Start" event:
	/*
	display_set_gui_size(window_get_width(), window_get_height())
	*/


// Pretty demo readouts
var line_string = "Consumer";
if my_crt.lines.min_sigma < 0.2 {
	line_string = "PVM";
}
if my_crt.lines.min_sigma > 0.3 {
	line_string = "No Lines";
}

var shadow_string = "Error";
if my_crt.mask.do_shadow {
	shadow_string = "Shadow Mask";
} else if my_crt.mask.slot_strength == 0 {
		shadow_string = "Aperture Grille";
} else {
	switch(my_crt.mask.slot_height) {
		case 0: shadow_string = "Short Slot Mask"; break;
		case 1: shadow_string = "Medium Slot Mask"; break;
		case 2: shadow_string = "Tall Slot Mask"; break;
	}
}

// Demo text
var gui_text = gfx_name + "\nFPS: " + string(fps);
gui_text += "\n<1> CRT Pass: " + (my_crt.final_pass_shader==shd_pass_crt ? "Enabled" : "Disabled");
gui_text += "\n<2> NTSC Pass: " + (my_crt.ntsc.enabled ? "Enabled" : "Disabled");
gui_text += "\n<3> Bloom Pass: " + (my_crt.bloom.enabled ? "Enabled" : "Disabled");
gui_text += "\n<4> Debug Overlay: " + (is_debug_overlay_open() ? "Open" : "Closed");
gui_text += "\n<5> Cycle Horizontal Mask:\n    (Current: " + sprite_get_name(my_crt.mask.sprite) + ")";
gui_text += "\n<6> Cycle Shadow Mask:\n    (Current: " + shadow_string + ")";
gui_text += "\n<7> Cycle Lines:\n    (Current: " + line_string + ")";
gui_text += "\n<8> Next Demo\n    (Current: " + demo_title + ")";
draw_rectangle_colour(0, 0, string_width(gui_text) + 16, string_height(gui_text) + 16, c_black, c_black, c_black, c_black, false);
draw_text(8, 8, gui_text);