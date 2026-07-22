if (menuDelay > 0)
{
    menuDelay--;
}

option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Credits"
option[0, 3] = "Achievements"
option[0, 4] = "Quit Game"

option[1, 1] = "Brightness: " + string(round(global.brightness * 100)) + "%"
option[1, 0] = "Controls"
option[1, 2] = "Master Volume: " + string(round(global.master_volume * 100)) + "%"
option[1, 3] = "Music Volume: " + string(round(global.music_volume * 100)) + "%"
option[1, 4] = "SFX Volume: " + string(round(global.sfxVolume * 100)) + "%"
option[1, 5] = "Back"

option[2, 0] = "Coding - PrimarySuspect"
option[2, 1] = "Art - PrimarySuspect"
option[2, 2] = "Music - PrimarySuspect"
option[2, 3] = "Level Design - PrimarySuspect"
option[2, 4] = "Sound Design - PrimarySuspect"
option[2, 5] = "(yes i did all of this myself)"
option[2, 6] = "Back"


option[3,0] = "Jump/select: " + chr(global.key_jump)
option[3,1] = "Dash: " + chr(global.key_dash)
option[3,2] = "Up: " + chr(global.key_up)
option[3,3] = "Down: " + chr(global.key_down)
option[3,4] = "Left: " + chr(global.key_left)
option[3,5] = "Right: " + chr(global.key_right)
option[3,6] = "Reset: " + chr(global.key_reset)
option[3,7] = "Interact: " + chr(global.key_interact)
option[3,8] = "click m to reset changes"
option[3,9] = "Back"

option[4,0] = "Flower - Perfect Fieldifur"
option[4,1] = "Top Hat - No Checkpoints Thornaballia"
option[4,2] = "Rocky - No Deaths Thornaballia"
option[4,3] = "Top Hat Hat - Perfect Thornaballia"
option[4,4] = "Next"
option[4,5] = "Back"

option[5,0] = "Checkpoint San - No Checkpoints Bramblemire"
option[5,1] = "Leaf Crown - No Deaths Bramblemire"
option[5,2] = "Thorn Crown - Perfect Bramblemire"
option[5,3] = "Devil Horns - Reach Bramblemire on one life"
option[5,4] = "Angel Halo - Beat Bramblemire on one life"
option[5,5] = "Next"
option[5,6] = "Back"


option[6,0] = "Sign - ???"
option[6,1] = "Dunce - ???"
option[6,2] = "Slime Pet - ???"
option[6,3] = "Back"

pad = global.gamepad;


left =
    keyboard_check_pressed(global.key_left) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padl) ||
        gamepad_axis_value(pad, gp_axislh) < -0.5
    ));

right =
    keyboard_check_pressed(global.key_right) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padr) ||
        gamepad_axis_value(pad, gp_axislh) > 0.5
    ));

up =
    keyboard_check_pressed(global.key_up) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padu) ||
        gamepad_axis_value(pad, gp_axislv) < -0.5
    ));

down =
    keyboard_check_pressed(global.key_down) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padd) ||
        gamepad_axis_value(pad, gp_axislv) > 0.5
    ));

jump =
    keyboard_check_pressed(global.key_jump) ||
    (pad != -1 && gamepad_button_check_pressed(pad, gp_face1));

jumpPressed =
    keyboard_check_pressed(global.key_jump) ||
    (pad != -1 && gamepad_button_check_pressed(pad, gp_face1));

dashPressed =
    keyboard_check_pressed(global.key_dash) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_shoulderrb)
    ));
	
interact =
    keyboard_check_pressed(global.key_interact) ||
    (pad != -1 && (gamepad_button_check_pressed(pad, gp_face3)));
	
reset =
    keyboard_check_pressed(global.key_reset) ||
    (pad != -1 && (gamepad_button_check_pressed(pad, gp_select)));
	
menuButtonPressed =
    keyboard_check_pressed(vk_escape) ||
    (global.gamepad != -1 && gamepad_button_check_pressed(global.gamepad, gp_start));

// get input
up_key = up
down_key = down
accept_key = jump
left_key = left
right_key = right
reset_key = reset
interact_key = interact


// store number of options in current menu
op_length = array_length(option[menu_level])

if !waiting_for_key
{
	//move through the menu
	pos += down_key - up_key
	if(pos >= op_length){pos = 0}
	if(pos < 0){pos = op_length - 1}
}

// using the options

if (accept_key)
{
	var _sml = menu_level
	
	switch(menu_level)
	{
		// pause menu
		case 0 :
		switch(pos)
		{
			// start game
			case 0: room_goto(TitleRoom) break
		
			// settings
			case 1: menu_level = 1 break
		
			// credits
			case 2: menu_level = 2 break
			
			// achievements
			case 3: menu_level = 4 break
		
			// exit game
			case 4: game_end() break
		}
		
		case 1:
		switch(pos)
		{
			// brightness
			case 1: break
			
			// Controls
			case 0:
		    menu_level = 3;
		    pos = 0;
		    menuDelay = 5;
			
			audio_play_sound(menuSFX, 1, false)
		    break;
			
			// Master Volume
			case 2: break
			
			// Music Volume
			case 3: break
			
			// SFX Volume
			case 4: break
			
			// Back
			case 5:
		    menu_level = 0;
			break;
		}
		
		case 2:
		switch(pos)
		{
			case 0: 
			break

			case 1: break
			
			case 2: break

			case 3: break

			case 4: break
			
			case 5: break
			
			case 6: menu_level = 0 break
		}
		
		case 3:
		switch(pos)
		{
		    case 0:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 1:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 2:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 3:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 4:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 5:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 6:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 7:
			
			if (menuDelay <= 0 && accept_key)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 8:
			
			resetControls()	
			
			break;
			
			case 9: menu_level = 0 audio_play_sound(menuSFX, 1, false) break;
		}
		break;
		
		case 4:
		switch(pos)
		{
			case 0: break

			case 1: break

			case 2: break

			case 3: break

			case 4: menu_level = 5; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			
			case 5: menu_level = 0; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 5:
		switch(pos)
		{
			case 0: break

			case 1: break

			case 2: break

			case 3: break

			case 4: break
			
			case 5: menu_level = 6; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			
			case 6: menu_level = 4; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 6:
		switch(pos)
		{
			case 0: break

			case 1: break

			case 2: break

			case 3: menu_level = 5; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
	}
	if _sml != menu_level {pos = 0}
	op_length = array_length(option[menu_level])
}

var _sml = menu_level

switch(menu_level)
{
	case 1:
		switch(pos)
		{
			// brightness
			case 1: 
			global.brightness += (right_key - left_key) * 0.1;
		    global.brightness = clamp(global.brightness, 0.5, 2.0); 
			
			with (windowManager)
			{
			    my_crt
			        .configure_lines({
			            image_softness: 0.5,
			            brightness: global.brightness + 0.5
			        })
			        .update_uniforms();
			}
			break
			
			
			// Controls
			case 0: break
			
			// Master Volume
			case 2: 
			global.master_volume += (right_key - left_key) * 0.1;
			global.master_volume = clamp(global.master_volume, 0, 4);

			audio_master_gain(global.master_volume);
			break
			
			// Music Volume
			case 3: 
			global.music_volume += (right_key - left_key) * 0.1;
			global.music_volume = clamp(global.music_volume, 0, 1);

			audio_sound_gain(soundtrackManager.music, global.music_volume, 0);
			break

			// SFX Volume
			case 4: 
			global.sfxVolume += (right_key - left_key) * 0.1;
			global.sfxVolume = clamp(global.sfxVolume, 0, 2);

			audio_sound_gain(global.sfxVolume, global.sfxVolume, 0);
			
			break
			
			// Back
			case 5:
			break;
		}
		
	if _sml != menu_level {pos = 0}
	op_length = array_length(option[menu_level])
}

if menu_level == 1 && (pos >= 1 && pos <= 4)
{
	if right_key || left_key
	{
		audio_play_sound(menuSFX, 0.5, false, global.sfxVolume, 0, 1.5)
	}
}

function get_pressed_key(current_key)
{
    if (keyboard_check_pressed(ord("A"))) return ord("A");
    if (keyboard_check_pressed(ord("B"))) return ord("B");
    if (keyboard_check_pressed(ord("C"))) return ord("C");
    if (keyboard_check_pressed(ord("D"))) return ord("D");
    if (keyboard_check_pressed(ord("E"))) return ord("E");
    if (keyboard_check_pressed(ord("F"))) return ord("F");
    if (keyboard_check_pressed(ord("G"))) return ord("G");
    if (keyboard_check_pressed(ord("H"))) return ord("H");
    if (keyboard_check_pressed(ord("I"))) return ord("I");
    if (keyboard_check_pressed(ord("J"))) return ord("J");
    if (keyboard_check_pressed(ord("K"))) return ord("K");
    if (keyboard_check_pressed(ord("L"))) return ord("L");
    if (keyboard_check_pressed(ord("M"))) return ord("M");
    if (keyboard_check_pressed(ord("N"))) return ord("N");
    if (keyboard_check_pressed(ord("O"))) return ord("O");
    if (keyboard_check_pressed(ord("P"))) return ord("P");
    if (keyboard_check_pressed(ord("Q"))) return ord("Q");
    if (keyboard_check_pressed(ord("R"))) return ord("R");
    if (keyboard_check_pressed(ord("S"))) return ord("S");
    if (keyboard_check_pressed(ord("T"))) return ord("T");
    if (keyboard_check_pressed(ord("U"))) return ord("U");
    if (keyboard_check_pressed(ord("V"))) return ord("V");
    if (keyboard_check_pressed(ord("W"))) return ord("W");
    if (keyboard_check_pressed(ord("X"))) return ord("X");
    if (keyboard_check_pressed(ord("Y"))) return ord("Y");
    if (keyboard_check_pressed(ord("Z"))) return ord("Z");

    if (keyboard_check_pressed(ord("0"))) return ord("0");
    if (keyboard_check_pressed(ord("1"))) return ord("1");
    if (keyboard_check_pressed(ord("2"))) return ord("2");
    if (keyboard_check_pressed(ord("3"))) return ord("3");
    if (keyboard_check_pressed(ord("4"))) return ord("4");
    if (keyboard_check_pressed(ord("5"))) return ord("5");
    if (keyboard_check_pressed(ord("6"))) return ord("6");
    if (keyboard_check_pressed(ord("7"))) return ord("7");
    if (keyboard_check_pressed(ord("8"))) return ord("8");
    if (keyboard_check_pressed(ord("9"))) return ord("9");

    if (keyboard_check_pressed(vk_space))     return vk_space;
    if (keyboard_check_pressed(vk_shift))     return vk_shift;
    if (keyboard_check_pressed(vk_control))   return vk_control;
    if (keyboard_check_pressed(vk_enter))     return vk_enter;
    if (keyboard_check_pressed(vk_escape))    return vk_escape;
    if (keyboard_check_pressed(vk_tab))       return vk_tab;
    if (keyboard_check_pressed(vk_backspace)) return vk_backspace;

    return current_key;
}

if (menu_level == 3 && waiting_for_key && pos == 0)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_jump);
		
        if key == vk_escape
		{
			waiting_for_key = false;
			audio_play_sound(unpauseSFX, 1, false)
		}
		else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_jump = key;
            waiting_for_key = false;
			audio_play_sound(pauseSFX, 1, false)
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 1)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_dash);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_dash = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 2)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_up);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_up = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 3)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_down);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_down = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 4)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_left);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_left = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 5)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_right);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_right = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 6)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_reset);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_reset = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 7)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_interact);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact))
        {
            global.key_interact = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if menu_level != 3
{
	waiting_for_key = false
}

if keyboard_check_pressed(ord("M"))
{
	resetControls()
}