if room != TitleRoom
{
	draw_set_font(PixelFont)
	draw_sprite(sprite_index, image_index, camera_get_view_x(view_camera[0]) + 8, y)



	switch(room)
	{
		case Room1: draw_set_color(make_color_rgb(30, 96, 110)) break
		case Room2: draw_set_color(make_color_rgb(122, 28, 75)); break
		case Room2_1: draw_set_color(make_color_rgb(122, 28, 75)); break
		case Room3: draw_set_color(make_color_rgb(49, 33, 55)) break
		case Room3_1: draw_set_color(make_color_rgb(49, 33, 55)) break
		case jumboRoom: draw_set_color(make_color_rgb(49, 33, 55)) break
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_center);

	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);

	draw_text_transformed(
	    camera_get_view_x(view_camera[0]) + 32,
	    livesObj.y + 10,
	    "X" + string(global.lifes),
	    0.5 / cameraManager.cam_zoom,
	    0.5 / cameraManager.cam_zoom,
	    0
	);
}

if room == TitleRoom
{
	draw_set_font(PixelFont)
	draw_sprite(sprite_index, image_index, camera_get_view_x(view_camera[0]) + 8, y)



	switch(room)
	{
		case TitleRoom: draw_set_color(make_color_rgb(30, 96, 110)) break
		case Room1: draw_set_color(make_color_rgb(30, 96, 110)) break
		case Room2: draw_set_color(make_color_rgb(122, 28, 75)); break
		case Room2_1: draw_set_color(make_color_rgb(122, 28, 75)); break
		case Room3: draw_set_color(make_color_rgb(49, 33, 55)) break
		case Room3_1: draw_set_color(make_color_rgb(49, 33, 55)) break
		case jumboRoom: draw_set_color(make_color_rgb(49, 33, 55)) break
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_center);

	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);

	draw_text_transformed(
	    camera_get_view_x(view_camera[0]) + 32,
	    livesObj.y + 10,
	    "X" + string(global.amountRuns),
	    0.5 / cameraManager.cam_zoom,
	    0.5 / cameraManager.cam_zoom,
	    0
	);
}