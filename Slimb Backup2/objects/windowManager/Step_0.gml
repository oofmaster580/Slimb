//show_debug_message("Fullscreen: " + string(global.fullScreen))

wasFull = global.fullScreen

global.fullScreen = window_get_fullscreen();

if room == TitleRoom || room == MainMenu
{
	my_crt
	.configure_lines({
		image_softness: 0.5,
		brightness: global.brightness + 0.5
	})
	.update_uniforms();
}
else if (room != Room3 && room != Room3_1) && !global.savageMod
{
	my_crt
	.configure_lines({
		image_softness: 0.5,
		brightness: global.brightness + 0.5
	})
	.update_uniforms();
}
else if (room != Room3 && room != Room3_1) && global.savageMod
{
	my_crt
	.configure_lines({
		image_softness: 0.5,
		brightness: global.brightness + 0
	})
	.update_uniforms();
}
else if (room == Room3 || room == Room3_1) && !global.savageMod
{
	my_crt
	.configure_lines({
		image_softness: 0.5,
		brightness: global.brightness + 2.5
	})
	.update_uniforms();
}
else if(room == Room3 || room == Room3_1) && global.savageMod
{
	my_crt
	.configure_lines({
		image_softness: 0.5,
		brightness: global.brightness + 2
	})
	.update_uniforms();
}

if !global.fullScreen && wasFull
{
    window_set_size(720 * global.resolution, 480 * global.resolution);
}