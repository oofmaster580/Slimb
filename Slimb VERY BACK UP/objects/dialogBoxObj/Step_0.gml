switch (room)
{
	case Room1: sprite_index = DialogBoxSpr break
	case Room2: sprite_index = DialogBoxSpr_1 break
	case Room2_1: sprite_index = DialogBoxSpr_1 break
	case Room3: sprite_index = DialogBoxSpr_2 break
}

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

if (char_index < string_length(full_text))
{
    char_index += text_speed;
    text = string_copy(full_text, 1, floor(char_index));
	audio_play_sound(dialogSFX, 0.8, false, global.sfxVolume, 0, random_range(1.98, 2.02))
}

image_alpha = 0