global.quotePos = pos

if (menuDelay > 0)
{
    menuDelay--;
}

if !global.gameBooted
{
	option[0, 0] = "Start Game"
}
else
{
	option[0, 0] = "Continue Game"
}

option[0, 1] = "Credits"
option[0, 2] = "Reset Progress"
option[0, 3] = "Quit Game"

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

option[3,0] = "Are you absolutely sure you want to do this?"
option[3,1] = "Of course I dont want to reset my progress!"

option[4,0] = "Once you do this, there is no going back!"
option[4,1] = "I change my mind!"

option[5,0] = "Last warning!!"
option[5,1] = "This process is too scary, nevermind."


pad = global.gamepad;


left =
    keyboard_check_pressed(global.key_left) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padl)
    ));

right =
    keyboard_check_pressed(global.key_right) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padr)
    ));

up =
    keyboard_check_pressed(global.key_up) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padu)
    ));

down =
    keyboard_check_pressed(global.key_down) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padd)
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
	
freeCamera =
    keyboard_check_pressed(global.key_freeCamera) ||
    (global.gamepad != -1 && gamepad_button_check_pressed(global.gamepad, gp_shoulderr)) ||
    (global.gamepad != -1 && gamepad_button_check_pressed(global.gamepad, gp_shoulderl));
	

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
	audio_play_sound(menuSFX, 0.5, false, global.sfxVolume)
	
	var _sml = menu_level
	
	switch(menu_level)
	{
		// pause menu
		case 0 :
		switch(pos)
		{
			// start game
			case 0: room_goto(TitleRoom) global.gameBooted = true break
		
			// credits
			case 1: menu_level = 2 break
			
			// reset progress
			case 2: menu_level = 3 break
		
			// exit game
			case 3: game_end() break
		}
		break
		
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
		break
		
		case 3:
		switch(pos)
		{
			case 0: menu_level = 4 break

			case 1: menu_level = 0 break
		}
		break
		
		case 4:
		switch(pos)
		{
			case 0: menu_level = 5 break

			case 1: menu_level = 0 break
		}
		break
		
		case 5:
		switch(pos)
		{
			case 0:
			
			global.hatsUnlocked = [0]
			global.deaths = 0
			global.gameBeat = false
			global.hatSelected = 0
			global.mostPoints = 0
			global.bestTime = 0
			global.amountRuns = 0
			
			global.excMod = false
			global.bankruptMod = false
			global.heavyMod = false
			global.hoarderMod = false
			
			global.talkedInvisDialogue = [0] 
			
			global.gameBooted = false
			
			menu_level = 0
			
			break

			case 1: menu_level = 0 break
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
		else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
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
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
        {
            global.key_interact = key;
            waiting_for_key = false;
            audio_play_sound(pauseSFX, 1, false);
        }
    }
}

if (menu_level == 3 && waiting_for_key && pos == 8)
{
    if (rebindBuffer > 0) rebindBuffer--;
    else
    {
        var key = get_pressed_key(global.key_freeCamera);

        if (key == vk_escape)
        {
            waiting_for_key = false;
            audio_play_sound(unpauseSFX, 1, false);
        }
        else if ((key != global.key_jump) && (key != global.key_up) && (key != global.key_down) && (key != global.key_right) && (key != global.key_left) && (key != global.key_reset) && (key != global.key_dash) && (key != global.key_interact) && (key != global.key_freeCamera))
        {
            global.key_freeCamera = key;
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