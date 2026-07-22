var levelX = camera_get_view_x(view_camera[0]) + 5;
var levelY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - sprite_height - 70;

draw_set_halign(fa_left);
draw_set_valign(fa_center);

if !instance_exists(musicNotification)
{
	switch (room)
	{
		case TitleRoom:
			//draw_sprite_ext(textBox, 0, levelX + 10, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(30, 96, 110) 


			//draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			//draw_text_transformed_colour(levelX + 32, levelY + 45, "Fieldifur", 1, 1, 0, color, color, color, color, 1);
			//draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: Small Bounds, Big Journey", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
		
		case Room1:
		draw_sprite_ext(textBox, 0, levelX + 10, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(30, 96, 110) 


			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "Fieldifur", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: Small Bounds, Big Journey", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
		
		case Room1_1:
		draw_sprite_ext(textBox, 0, levelX + 10, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(30, 96, 110) 


			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "Fieldifury", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: Long Journey, Longer Fall", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
	
		case Room2:
		draw_sprite_ext(textBox_1, 0, levelX, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(122, 28, 75) 


			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "Thornaballia", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: Yikes! Spikes!", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
		
		case Room2_1:
		draw_sprite_ext(textBox_1, 0, levelX, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(122, 28, 75) 


			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "Thornbound", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: Yikes! Even More Spikes!", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
	
		case Room3:
		draw_sprite_ext(textBox_2, 0, levelX, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(49, 33, 55) 

			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "Bramblemire", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: MireMarch", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
		
		case Room3_1:
		draw_sprite_ext(textBox_2, 0, levelX, levelY, 1.5, 1.5, 0, c_white, 1);

			color = make_color_rgb(49, 33, 55) 

			draw_text_transformed_colour(levelX + 24, levelY + 30, "Now Entering...", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 32, levelY + 45, "BrambleMayhem", 1, 1, 0, color, color, color, color, 1);
			draw_text_transformed_colour(levelX + 24, levelY + 60, "Song: MireMassacre", 0.6, 0.6, 0.6, color, color, color, color, 1);

			draw_set_alpha(1);
		break;
	}
}

// important stuff

var _new_w = 0;

var currentLength = array_length(option[menu_level]);

for (var i = 0; i < currentLength; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}

op_length = currentLength;

width = _new_w + op_border*2
height = op_border * 2 + string_height(option[0, 0]) + (op_length-1)*op_space

if room == Room1 || room == Room1_1
{
	// center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

	// draw the options
	draw_set_font(PixelFont)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	for(var i = 0; i < op_length; i++)
	{
		var _c = make_color_rgb(30, 96, 110)
		if pos == i {_c = make_color_rgb(45, 27, 0)}
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
	}
}
else if room == TitleRoom
{
	// center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

	// draw the options
	draw_set_font(PixelFont)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	for(var i = 0; i < op_length; i++)
	{
		var _c = make_color_rgb(30, 96, 110)
		if pos == i {_c = make_color_rgb(45, 27, 0)}
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
	}
}
else if room == Room2 || room == Room2_1
{
	// center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

	// draw the options
	draw_set_font(PixelFont)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	for(var i = 0; i < op_length; i++)
	{
		var _c = make_color_rgb(122, 28, 75)
		if pos == i {_c = make_color_rgb(27, 3, 38)}
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
	}
}
else if room == Room3 || room == Room3_1
{
	// center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

	// draw the options
	draw_set_font(PixelFont)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	for(var i = 0; i < op_length; i++)
	{
		var _c = make_color_rgb(49, 33, 55)
		if pos == i {_c = make_color_rgb(27, 3, 38)}
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
	}
}
else if room == jumboRoom
{
	// center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1)

	// draw the options
	draw_set_font(PixelFont)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	for(var i = 0; i < op_length; i++)
	{
		var _c = make_color_rgb(49, 33, 55)
		if pos == i {_c = make_color_rgb(27, 3, 38)}
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1)
	}
}

var quote = "If you are seeing this, there is a bug!"

if (menu_level == 4 && global.quotePos == 0)
{
	if (array_contains(global.hatsUnlocked, 1))
	{
		quote = "''Time to put what you've learned all together!''";
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 4 && global.quotePos == 1
{
	if (array_contains(global.hatsUnlocked, 2))
	{
		quote = "''Wonder what it'll grow into..''";
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 4 && global.quotePos == 2
{
	if (array_contains(global.hatsUnlocked, 3))
	{
		quote = "''A fancy hat for a reckless climber.''";
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 4 && global.quotePos == 3
{
	if (array_contains(global.hatsUnlocked, 4))
	{
		quote = "''Zero mistakes, maximum style.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 4 && global.quotePos == 4
{
	
	
	if (array_contains(global.hatsUnlocked, 5))
	{
		quote = "''A hat so fancy that it also needed one''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 5 && global.quotePos == 0
{
	if (array_contains(global.hatsUnlocked, 6))
	{
		quote = "''The checkpoints got bored waiting..''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 5 && global.quotePos == 1
{
	
	
	if (array_contains(global.hatsUnlocked, 7))
	{
		quote = "''It is the rain thar grows the grass, not the thunder.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 5 && global.quotePos == 2
{
	
	
	if (array_contains(global.hatsUnlocked, 8))
	{
		quote = "''Beauty is pain.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 5 && global.quotePos == 3
{
	
	
	if (array_contains(global.hatsUnlocked, 9))
	{
		quote = "''The Devil respects persistance.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 5 && global.quotePos == 4
{
	
	
	if (array_contains(global.hatsUnlocked, 10))
	{
		quote = "''Patience is a virtue!''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 0
{
	if (array_contains(global.hatsUnlocked, 11))
	{
		quote = "''Don't touch that dial folks!''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 1
{
	if (array_contains(global.hatsUnlocked, 12))
	{
		quote = "''NO REFUNDS! PURCHASES FINAL!''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 2
{
	if (array_contains(global.hatsUnlocked, 13))
	{
		quote = "''Still Watching? I bet you are.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 3
{
	if (array_contains(global.hatsUnlocked, 14))
	{
		quote = "''Death is just a minor inconvenience.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 4
{
	if (array_contains(global.hatsUnlocked, 15))
	{
		quote = "''Should be obvious why this is the heavy unlock.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 6 && global.quotePos == 5
{
	if (array_contains(global.hatsUnlocked, 16))
	{
		quote = "''Even angels fall. The question is whether they get back up.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 8 && global.quotePos == 0
{
	if (array_contains(global.hatsUnlocked, 17))
	{
		quote = "''It somehow survived the climb..''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 8 && global.quotePos == 1
{
	if (array_contains(global.hatsUnlocked, 18))
	{
		quote = "''Distinguished, now aint we?''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 8 && global.quotePos == 2
{
	if (array_contains(global.hatsUnlocked, 19))
	{
		quote = "''You've seen enough warnings...''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 8 && global.quotePos == 3
{
	if (array_contains(global.hatsUnlocked, 20))
	{
		quote = "''This is quite amusing.''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 8 && global.quotePos == 4
{
	if (array_contains(global.hatsUnlocked, 21))
	{
		quote = "''Did you expect a congrats?''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 9 && global.quotePos == 0
{
	if (array_contains(global.hatsUnlocked, 22))
	{
		quote = "''Five more minutes...''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 9 && global.quotePos == 1
{
	if (array_contains(global.hatsUnlocked, 23))
	{
		quote = "''No, you can't fly. (yet!)''"
	}
	else
	{
		quote = "Locked";
	}
}
else if menu_level == 9 && global.quotePos == 2
{
	if (array_contains(global.hatsUnlocked, 24))
	{
		quote = "''You collected everything, even a friend! His names Pip :)''";
	}
	else
	{
		quote = "Locked";
	}
}

//

else if menu_level == 7 && global.quotePos == 0
{
	if (global.mostPoints > 50000)
	{
		quote = "'Ya missed one'"
	}
	else
	{
		quote = "Reach a highscore of 50000";
	}
}
else if menu_level == 7 && global.quotePos == 1
{
	if (global.mostPoints > 125000)
	{
		quote = "'Those coins weren't for you anyway.'"
	}
	else
	{
		quote = "Reach a highscore of 125000";
	}
}

else if menu_level == 7 && global.quotePos == 2
{
	if (global.gameBeat)
	{
		quote = "'Hope you weren't planning to explore.'"
	}
	else
	{
		quote = "Beat the game to unlock";
	}
}
else if menu_level == 7 && global.quotePos == 3
{
	if (array_contains(global.hatsUnlocked, 12))
	{
		quote = "'Please don't make me watch this.'"
	}
	else
	{
		quote = "Collect every cosmetic to unlock";
	}
}
else if menu_level == 7 && global.quotePos == 4
{
	if (global.gameBeat)
	{
		quote = "'Speed sold seperately!'"
	}
	else
	{
		quote = "Beat the game";
	}
}
else if menu_level == 7 && global.quotePos == 5
{
	if (global.gameBeat)
	{
		quote = "'You beat the game. Unfortunately, it remembers.'"
	}
	else
	{
		quote = "Beat the game";
	}
}
else
{
	quote = "'IF YOU ARE SEEING THIS, ITS A BUG!!'"
}






if menu_level >= 4 && menu_level <= 9 && (room == Room1 || room == TitleRoom || room == Room1_1)
{
	draw_set_font(PixelFont)
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	
	var _c = make_color_rgb(30, 96, 110)
	var cam = view_camera[0]
	
	var quoteBoxY = y + height + 24;
	var quoteBoxHeight = string_height(quote) + 20;
	var quoteBoxWidth = string_width(quote) + 40;
	
	if menu_level == 4 && global.quotePos != 5 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 5 && global.quotePos != 5 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 6 && global.quotePos != 6 && global.quotePos != 7
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 7 && global.quotePos != 6 
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 8 && global.quotePos != 5 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 9 && global.quotePos != 3
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
}



if menu_level >= 4 && menu_level <= 7 && (room == Room2 || room == Room2_1)
{
	draw_set_font(PixelFont)
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	
	var _c = make_color_rgb(122, 28, 75)
	var cam = view_camera[0]
	
	var quoteBoxY = y + height + 24;
	var quoteBoxHeight = string_height(quote) + 20;
	var quoteBoxWidth = string_width(quote) + 40;
	
	if menu_level == 4 && global.quotePos != 4 && global.quotePos != 5
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 5 && global.quotePos != 5 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 6 && global.quotePos != 3
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 7 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
}

if menu_level >= 4 && menu_level <= 7 && (room == Room3 || room == Room3_1)
{
	draw_set_font(PixelFont)
	draw_set_valign(fa_center)
	draw_set_halign(fa_middle)
	
	var _c = make_color_rgb(49, 33, 55)
	var cam = view_camera[0]
	
	var quoteBoxY = y + height + 24;
	var quoteBoxHeight = string_height(quote) + 20;
	var quoteBoxWidth = string_width(quote) + 40;
	
	if menu_level == 4 && global.quotePos != 4 && global.quotePos != 5
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 5 && global.quotePos != 5 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 6 && global.quotePos != 3
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
	
	if menu_level == 7 && global.quotePos != 6
	{
		draw_sprite_ext(
		    sprite_index,
		    image_index,
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2 - quoteBoxWidth / 2,
		    quoteBoxY - 16,
		    quoteBoxWidth / sprite_width,
		    quoteBoxHeight / sprite_height,
		    0,
		    c_white,
		    1
		);

		draw_text_color(
		    camera_get_view_x(cam) + camera_get_view_width(cam) / 2,
		    quoteBoxY + 2,
		    quote,
		    _c, _c, _c, _c,
		    1
		);
	}
}