global.godmode = false
global.pointMult = 1
global.checkpointID = 0
global.throwUpPlayer = 0

moving = false;
xspeed = 2;
yspeed = 0

hvel = 0;

max_speed = 2;
accel = 0.15;
frictionVar = 0.08;

jumpHeight = 4
gravitySpeed = 0.1

crouch = false

dashTimer = 0
dashCooldown = 0
dashTimer2 = 0
dash = true
dashing = false
dashing2 = false


previousX = x
previousY = y

hsp = 0;

was_grounded = false;

checkpointX = x
checkpointY = y

coyoteTime = 0;
coyoteFrames = 10;

jumpBuffer = 0;
jumpBufferFrames = 10;

pauseBuffer = 0;
dashStopTimer = 0;

insideDashBlock = false;

global.levelLifes = true
global.hasntDied = true
global.gotCheckpoint = false

gamepad_set_axis_deadzone(global.gamepad, 0.2);

pad = global.gamepad;

left =
    keyboard_check(global.key_left) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padl) ||
        gamepad_axis_value(pad, gp_axislh) < -0.5
    ));

right =
    keyboard_check(global.key_right) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padr) ||
        gamepad_axis_value(pad, gp_axislh) > 0.5
    ));

up =
    keyboard_check(global.key_up) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padu) ||
        gamepad_axis_value(pad, gp_axislv) < -0.5
    ));

down =
    keyboard_check(global.key_down) ||
    (pad != -1 && (
        gamepad_button_check(pad, gp_padd) ||
        gamepad_axis_value(pad, gp_axislv) > 0.5
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
    (pad != -1 && (gamepad_button_check_pressed(pad, gp_face4)));
	
menuButtonPressed =
    keyboard_check_pressed(vk_escape) ||
    (global.gamepad != -1 && gamepad_button_check_pressed(global.gamepad, gp_start));
	
freeCamera =
    keyboard_check(global.key_freeCamera) ||
    (global.gamepad != -1 && gamepad_button_check(global.gamepad, gp_shoulderr)) ||
    (global.gamepad != -1 && gamepad_button_check(global.gamepad, gp_shoulderl));