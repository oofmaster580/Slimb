if room != TitleRoom && !global.isBoss
{
	draw_set_font(PixelFont)

	draw_set_halign(fa_right);
	draw_set_valign(fa_center);

	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);

	var minutes = floor(global.timer / 60);
	var seconds = floor(global.timer) mod 60;
	var centiseconds = floor((global.timer - floor(global.timer)) * 100);

	var sec_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);
	var cs_text = (centiseconds < 10) ? "0" + string(centiseconds) : string(centiseconds);

	var time_text = string(minutes) + ":" + sec_text + "." + cs_text;

	draw_text_transformed(
	    cam_x + camera_get_view_width(view_camera[0]) - 8,
	    cam_y + 8,
	    time_text,
	    0.5,
	    0.5,
	    0
	);

	draw_set_alpha(roomTimeAlpha);



	draw_text_transformed(
		cam_x + camera_get_view_width(view_camera[0]) - 8,
		cam_y + 24,
		roomTimeText,
		0.5,
		0.5,
		0	
	);

	draw_set_alpha(1);
}

if room == TitleRoom
{
	draw_set_font(PixelFont)

	draw_set_halign(fa_right);
	draw_set_valign(fa_center);

	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);

	var minutes = floor(global.bestTime / 60);
	var seconds = floor(global.bestTime) mod 60;
	var centiseconds = floor((global.bestTime - floor(global.bestTime)) * 100);

	var sec_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);
	var cs_text = (centiseconds < 10) ? "0" + string(centiseconds) : string(centiseconds);

	var time_text = string(minutes) + ":" + sec_text + "." + cs_text;

	draw_text_transformed(
	    cam_x + camera_get_view_width(view_camera[0]) - 8,
	    cam_y + 8,
	    time_text,
	    0.5,
	    0.5,
	    0
	);
	draw_set_alpha(1);
}