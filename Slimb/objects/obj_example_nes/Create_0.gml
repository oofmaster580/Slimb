/// @description Init
event_inherited();

var demo_config = {
	geometry: {
		content_width: 256,
		content_height: 240,
		do_int_scale: false,
		zoom: 1.1,
		border_width: 0.05,
		offset_x: -0.1
	},
	ntsc: {
		phase_offset_per_line: 0.3333,
		phase_offset_per_frame: 0.6667
	}
}

my_crt = new CRT(demo_config);
demo_title = "NES NTSC";