width = 128
height = 120

quoteBoxY = 0;
quoteBoxWidth = 200;
quoteBoxHeight = 50;

op_border = 8
op_space = 16

pos = 0;
/*
global.hoarderMod = false
global.excMod = false
global.bankruptMod = false
global.impatientMod = false
*/

// pause menu
option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Credits"
option[0, 3] = "Achievements"
option[0, 4] = "Modifiers"
option[0, 5] = "Return to homeworld"
option[0, 6] = "Start/Restart Playthrough"
option[0, 7] = "Quit Game"

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

// controls menu

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

option[5,0] = "Checkpoint-San - No Checkpoints Bramblemire"
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

// Modifiers
if global.hoarderMod
{
	option[7,0] = "Hoarder - If score reaches 0, you restart; ON"
}
else
{
	option[7,0] = "Hoarder - If score reaches 0, you restart; OFF"
}

if global.bankruptMod
{
	option[7,1] = "Greedy - No Coins; ON"
}
else
{
	option[7,1] = "Greedy - No Coins; OFF"
}

if global.impatientMod
{
	option[7,2] = "Impatient - Par Time Required; ON"
}
else
{
	option[7,2] = "Impatient - Par Time Required; OFF"
}

if global.excMod
{
	option[7,3] = "Excruciating - One Life; ON"
}
else
{
	option[7,3] = "Excruciating - One Life; OFF"
}

if global.savageMod
{
	option[7,5] = "Savage - New Game+; ON"
}
else
{
	option[7,5] = "Savage - New Game+; ON"
}

option[7,6] = "back"




waiting_for_key = false;
key_to_change = -1;

op_length = array_length(option)
menu_level = 0


sfxVolume = 1.0;

if room == Room1 || room == Room1_1 || room == TitleRoom
{
	sprite_index = menuSpr
}
else if room == Room2 || room == Room2_1
{
	sprite_index = menuSpr_1
}
else if room == Room3 || room == Room3_1
{
	sprite_index = menuSpr_2
}

rebindBuffer = 0;

menuDelay = 0;

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