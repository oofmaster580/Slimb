loadControls()
loadSettings()

width = 130
height = 120

/*global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");
global.key_jump = ord("J");
global.key_dash = ord("I");
global.key_reset = ord("R");
global.key_interact = ord("E");
*/

op_border = 8
op_space = 16

pos = 0;

// pause menu
option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Credits"
option[0, 3] = "Achievements"
option [0, 4] = "Quit Game"

// settings menu
option[1, 1] = "Brightness: " + string(round(global.brightness * 100)) + "%"
option[1, 0] = "Controls"
option[1, 2] = "Master Volume: " + string(round(global.master_volume * 100)) + "%"
option[1, 3] = "Music Volume: " + string(round(global.music_volume * 100)) + "%"
option[1, 4] = "SFX Volume: " + string(round(global.sfxVolume * 100)) + "%"
option[1, 5] = "Back"

// credits menu
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

if !array_contains(global.hatsUnlocked, 10)
{
	option[6,1] = "Dunce - ???"
}
else
{
	option[6,1] = "Dunce - Waste Time in Fieldifur"
}

if !array_contains(global.hatsUnlocked, 11)
{
	option[6,0] = "Sign - ???"
}
else
{
	option[6,0] = "Sign - Die a total of 50 times"
}

if !array_contains(global.hatsUnlocked, 12)
{
	option[6,2] = "Slime Pet - ???"
}
else
{
	option[6,2] = "Slime Pet - Collect every cosmetic!"
}



option[6,3] = "Back"

waiting_for_key = false;
key_to_change = -1;

op_length = array_length(option)
menu_level = 0


sfxVolume = 1.0;


rebindBuffer = 0;
menuDelay = 0;

global.gamepad = -1;
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