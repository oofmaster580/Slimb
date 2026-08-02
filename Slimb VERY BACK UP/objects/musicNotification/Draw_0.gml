// Draw text
draw_set_font(PixelFont);
draw_self()

draw_set_halign(fa_left);
draw_set_valign(fa_center);

color = make_color_rgb(30, 96, 110)

switch(room)
{
	case Room1: color = make_color_rgb(30, 96, 110) break
	case Room1_1: color = make_color_rgb(30, 96, 110) break
	case Room2: color = make_color_rgb(122, 28, 75) break
	case Room2_1: color = make_color_rgb(122, 28, 75) break
	case Room3: color = make_color_rgb(49, 33, 55) break
	case Room3_1: color = make_color_rgb(49, 33, 55) break
}

draw_text_transformed_colour(x + 16, y + 30, "Now Entering...", 1, 1, 0, color, color, color, color, alpha);
draw_text_transformed_colour(x + 24, y + 45, place_name, 1, 1, 0, color, color, color, color, alpha);
draw_text_transformed_colour(x + 16, y + 60, "Song: " + song, 0.6, 0.6, 0.6, color, color, color, color, alpha);

draw_set_alpha(1);