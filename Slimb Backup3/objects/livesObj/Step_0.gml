if instance_exists(obj_pause_menu) return

x = camera_get_view_x(view_camera[0]) + 8;
y = camera_get_view_y(view_camera[0]) + 8;

if(keyboard_check_pressed(global.key_reset) && room != TitleRoom)
{
	instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	global.lifes--
	global.deaths++
	global.hasntDied = false
	global.diedThisGame = true

	playerObj.x = playerObj.checkpointX
	playerObj.y = playerObj.checkpointY

	audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
}

switch(room)
{
	case TitleRoom: image_index = 0 break
	case Room1: image_index = 0 break
	case Room1_1: image_index = 0 break
	case Room2: image_index = 1 break
	case Room2_1: image_index = 1 break
	case Room3: image_index = 2 break
	case Room3_1: image_index = 2 break
	case jumboRoom: image_index = 2 break
}

image_alpha = 0

switch(room)
{
	case TitleRoom: draw_set_color(make_color_rgb(30, 96, 110)) break
	case Room1: draw_set_color(make_color_rgb(30, 96, 110)) break
	case Room1_1: draw_set_color(make_color_rgb(30, 96, 110)) break
	case Room2: draw_set_color(make_color_rgb(122, 28, 75)); break
	case Room2_1: draw_set_color(make_color_rgb(122, 28, 75)); break
	case Room3: draw_set_color(make_color_rgb(49, 33, 55)) break
	case Room3_1: draw_set_color(make_color_rgb(49, 33, 55)) break
	case jumboRoom: draw_set_color(make_color_rgb(49, 33, 55)) break
}