audio_group_load(audiogroup1);

global.hasntDied = true
global.checkpointGotten = false
global.plusOneGotten = false
global.hasntMoved = 0

pad = global.gamepad;

left =
    keyboard_check(global.key_left) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padl)
    ));

right =
    keyboard_check(global.key_right) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padr)
    ));

up =
    keyboard_check(global.key_up) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padu)
    ));

down =
    keyboard_check(global.key_down) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padd)
    ));

jump =
    keyboard_check(global.key_jump) ||
    (pad != -1 && gamepad_button_check(pad, gp_face1));

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