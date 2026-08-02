draw_set_halign(fa_middle);
draw_set_valign(fa_center);

draw_sprite(sprite_index, image_index, camera_get_view_x(view_camera[0]),  camera_get_view_y(view_camera[0]))

switch (room)
{
	case TitleRoom: draw_set_color(make_color_rgb(30, 96, 110)) break
	case Room1: draw_set_color(make_color_rgb(30, 96, 110)) break
	case Room2: draw_set_color(make_color_rgb(122, 28, 75)) break
	case Room3: draw_set_color(make_color_rgb(49, 33, 55)) break
}

draw_set_font(PixelFont)

draw_text(
camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 4.35,
camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.93, 
name)

draw_set_halign(fa_right);
draw_set_valign(fa_center);

if global.controllerType == "PC"
{
	draw_text(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 1.08,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.25, 
	chr(global.key_interact) + " > ")
}
else if global.controllerType == "Playstation"
{
	draw_text(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 1.08,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.25, 
	"Square > ")
}
else if global.controllerType == "Xbox"
{
	draw_text(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 1.08,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.25, 
	"X > ")
}
else if global.controllerType == "Nintendo"
{
	draw_text(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 1.08,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.25, 
	"Y > ")
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(
    camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 10,
    camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 1.7,
    text, 16, 400
);