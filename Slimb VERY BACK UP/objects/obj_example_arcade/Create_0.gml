/// @description Init
event_inherited();

var demo_config = {
	geometry: {
		content_width: 320,
		content_height: 224,
		do_int_scale: false,
		zoom: 1.1,
		border_width: 0.05,
		offset_x: -0.1
	},
	ntsc: {
		enabled: false
	},
	lines: {
		deconvergence: 0.5,
		image_softness: 0.75
	}
}

my_crt = new CRT(demo_config);
demo_title = "Arcade RGB";