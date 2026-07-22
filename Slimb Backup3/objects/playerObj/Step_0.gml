pad = global.gamepad;

show_debug_message(pad)

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
    (pad != -1 && (gamepad_button_check_pressed(pad, gp_select)));
	
menuButtonPressed =
    keyboard_check_pressed(vk_escape) ||
    (global.gamepad != -1 && gamepad_button_check_pressed(global.gamepad, gp_start));
	 
	
if global.isCutscene
{
	image_index = 0
}

if global.throwUpPlayer != 0
{
	if grounded
	{
		yspeed = global.throwUpPlayer
		global.throwUpPlayer = 0
	}
	else
	{
		global.throwUpPlayer = 0
	}
}



x = round(x);
y = round(y);

//show_debug_message("Best Time: " + string(global.bestTime))

if (instance_exists(dialogBoxObj) || instance_exists(obj_pause_menu) )
{
	image_speed = 0
}
else
{
	image_speed = 1
}



if (instance_exists(dialogBoxObj)) return;
if (instance_exists(obj_pause_menu)) return;

var dt = clamp(delta_time / 16666.6667, 0, 2)

var sprIdle = playerSpr;
var sprJump = playerSprJump;
var sprMove = playerSprMovement;
var sprCrouch = playerSprCrouch;

switch(room)
{
	case Room1:
		sprIdle = playerSpr;
		sprJump = playerSprJump;
		sprMove = playerSprMovement;
		sprCrouch = playerSprCrouch;
	break
	
	case Room2:
		sprIdle = playerSpr_1;
		sprJump = playerSprJump_1;
	    sprMove = playerSprMovement_1;
	    sprCrouch = playerSprCrouch_1;
	break
	
	case Room2_1:
		sprIdle = playerSpr_1;
		sprJump = playerSprJump_1;
	    sprMove = playerSprMovement_1;
	    sprCrouch = playerSprCrouch_1;
	break
	
	case Room3:
		sprIdle = playerSpr_2;
		sprJump = playerSprJump_2;
		sprMove = playerSprMovement_2;
		sprCrouch = playerSprCrouch_2;
	break
	
	case Room3_1:
		sprIdle = playerSpr_2;
		sprJump = playerSprJump_2;
		sprMove = playerSprMovement_2;
		sprCrouch = playerSprCrouch_2;
	break
	
	case jumboRoom:
		sprIdle = playerSpr_2;
		sprJump = playerSprJump_2;
		sprMove = playerSprMovement_2;
		sprCrouch = playerSprCrouch_2;
	break
}

var platform = instance_place(x, y + 2, obj_oneway_platform);

var on_platform = false;
var on_platform2 = false;

if (platform != noone)
{
    on_platform = bbox_bottom <= platform.bbox_top + 2;
	on_platform2 = bbox_bottom <= platform.bbox_top - yspeed * dt;
}
    
grounded = place_meeting(x, y + 2, hitboxColObj) || place_meeting(x, y + 2, dashColObj) || on_platform
floorGrounded = place_meeting(x, y + 2, hitboxColObj) || on_platform
wallLeft = place_meeting(x - xspeed * dt, y, hitboxColObj);
wallRight = place_meeting(x + xspeed * dt, y, hitboxColObj);

var landed_dash =
    !was_grounded &&
    (dashTimer > 0 || dashTimer2 > 0 || dashing2) &&
    (place_meeting(x, y - yspeed * dt, hitboxColObj));
	
var ceiling = place_meeting(x, y - abs(yspeed), hitboxColObj);

if (landed_dash && !ceiling)
{
	if down
	{
	    yspeed = jumpHeight + 1;
	    xspeed = 8
	    sprite_index = sprJump;
	    image_index = 1;

	    // Refresh the dash
	    dashTimer = 99;
	    dashCooldown = 0;
	    dashing = true;
	    dashing2 = false;
		
		cameraManager.shake = 7
		cameraManager.shakeFade = 0.6
		
		audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.5)
	}
}



if (dashing && dashTimer2 > 0 && yspeed > 0 && !ceiling
&& !place_meeting(x + xspeed * dt, y + yspeed * dt, dashColObj)
&& (left || right) && !down)
{
    if (wallLeft && left && !place_meeting(x + 8, y, hitboxColObj))
    {
        yspeed = 10;
        hsp = 8;
		x += 3
        dashTimer2 = 0;
        dashTimer = 0;
        dashCooldown = 0;
        audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.5);
		
		cameraManager.shake = 10
		cameraManager.shakeFade = 0.85
    }

    if (wallRight && right && !place_meeting(x - 8, y, hitboxColObj))
    {
        yspeed = 10;
        hsp = -8;
		x -= 3
        dashTimer2 = 0;
        dashTimer = 0;
        dashCooldown = 0;
        audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.5);
		
		cameraManager.shake = 10
		cameraManager.shakeFade = 0.85
    }
}

mask_index = playerSpr


var canJump = grounded || coyoteTime > 0;

if (grounded)
{
    coyoteTime = coyoteFrames;
}
else if (coyoteTime > 0)
{
    coyoteTime -= dt;
}

if jumpPressed
{
    jumpBuffer = jumpBufferFrames;
}
else if (jumpBuffer > 0)
{
    jumpBuffer -= dt;
}

if (pauseBuffer > 0)
{
    pauseBuffer--;
}

// Up and down movement

yspeed -= gravitySpeed * dt

if jump
{
	gravitySpeed = 0.2
}
else if down
{
	gravitySpeed = 0.6
}
else
{
	gravitySpeed = 0.4
}

if (jumpPressed && !global.isCutscene)
{
    if (wallLeft)
    {
        audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.4, 0, random_range(1, 1.2));
		repeat(4)
		{
			instance_create_layer(x, y + 2, "effects", effectObjWallLeft)
		}
    }
	
	if (wallRight)
    {
        audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.4, 0, random_range(1, 1.2));
		repeat(4)
		{
			instance_create_layer(x, y + 2, "effects", effectObjWallRight)
		}
    }
}

if (canJump)
{
	if (jumpPressed || jumpBuffer > 0) && !global.isCutscene
	{
	    if (coyoteTime > 0)
	    {
	        yspeed = jumpHeight;
	        sprite_index = sprJump;
	        image_index = 1;
			jumpBuffer = 0;	
			coyoteTime = 0;
			audio_play_sound(JumpSFX, 0.5, false, global.sfxVolume * 0.4, 0, random_range(1.5, 2));
			
			repeat(4)
			{
				instance_create_layer(x, y + 2, "effects", effectObj)
			}
			
	    }
	    else if (wallLeft)
	    {
	        yspeed = jumpHeight;
	        xspeed = 6;
	        image_xscale = 1;
	        sprite_index = sprJump;
			//show_debug_message("Wall Left");
			
	    }
	    else if (wallRight)
	    {
	        yspeed = jumpHeight;
	        xspeed = 6;
	        image_xscale = -1;
	        sprite_index = sprJump;
			//show_debug_message("Wall Right");
			
	    }
	}
}

if (place_meeting(x, y - yspeed * dt, hitboxColObj) || (!dashing && place_meeting(x, y - yspeed * dt, dashColObj)))
{
	
	if (!place_meeting(x, y - sign(yspeed), hitboxColObj) && (dashing || !place_meeting(x, y - sign(yspeed), dashColObj)))
	{
		
		y -= sign(yspeed) * dt
		
	}
	
	yspeed = 0
	if grounded
	{
		sprite_index = sprIdle
	}
}

if (grounded)
{
    sprite_index = sprIdle;
}

if(place_meeting(x, y - yspeed * dt, hitboxColObj))
{
	dashTimer = 0
	dashTimer2 = 0
}

else
{
    var old_bottom = bbox_bottom;

    y -= yspeed * dt;

    if (!down && yspeed < 0)
    {
        platform = instance_place(x, y, obj_oneway_platform);

        if (platform != noone)
        {
            if (old_bottom <= platform.bbox_top)
            {
                y = platform.bbox_top - (bbox_bottom - y);
                yspeed = 0;
                grounded = true;
            }
        }
    }
}

if down && grounded && !global.isCutscene
{
	crouch = true
	image_xscale = 1
}
else
{
	crouch = false
}

if down && yspeed = 0 && !global.isCutscene
{
	sprite_index = sprCrouch
}

if(!grounded && yspeed <= 0 && yspeed >= -0.6)
{
    image_index = 57;
}

// Side to side movement

// Side to side movement

if (!crouch)
{
    if (right && !global.isCutscene && (!global.heavyMod || room == TitleRoom || (!grounded && !floorGrounded) || dashing))
    {
        if (!place_meeting(x + xspeed * dt, y, hitboxColObj) &&
            !place_meeting(x + xspeed * dt, y, hitboxColObjWall))
        {
            if (dashing || !place_meeting(x + xspeed * dt, y, dashColObj))
            {
                x += xspeed * dt;
            }
        }

        if (grounded)
        {
            sprite_index = sprMove;
        }

        image_xscale = 1;
    }
    else if (left && !global.isCutscene && (!global.heavyMod || room == TitleRoom || (!grounded && !floorGrounded) || dashing))
    {
        if (!place_meeting(x - xspeed * dt, y, hitboxColObj) &&
            !place_meeting(x - xspeed * dt, y, hitboxColObjWall))
        {
            if (dashing || !place_meeting(x - xspeed * dt, y, dashColObj))
            {
                x -= xspeed * dt;
            }
        }

        if (grounded)
        {
            sprite_index = sprMove;
        }

        image_xscale = -1;
    }
    else
    {
        image_xscale = 1;
    }
}

// Dash Ability

dashing = dashTimer >= 0.1 || dashTimer2 >= 0.1

if (dashPressed && (left || right) && dash && !global.isCutscene)
{
    dashTimer = 35;
	xspeed = 8;


    audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.3, 0, random_range(2.7, 2.9));

    repeat(4)
    {
        instance_create_layer(x, y + 2, "effects", effectObj);
    }
}

if (keyboard_check_pressed(ord("O")) && (left || right) && global.godmode && !global.isCutscene)
{
    dashTimer = 35
    xspeed = 16
	dashCooldown = 0;
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.3, 0, random_range(2.7, 2.9))
	repeat(4)
	{
		instance_create_layer(x, y + 2, "effects", effectObj)
	}
}

if (dashPressed && (up) && dash && !global.isCutscene)
{
    dashTimer2 = 35
    yspeed = 8
	dashCooldown = 12212100;
	sprite_index = sprJump
	image_index = 3
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.6, 0, random_range(2.7, 2.9))
	repeat(4)
	{
		instance_create_layer(x, y + 2, "effects", effectObj)
	}
}

if (keyboard_check_pressed(ord("O")) && (up) && global.godmode)
{
    dashTimer2 = 35
    yspeed = 16
	dashCooldown = 12212100;
	sprite_index = sprJump
	image_index = 3
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.6, 0, random_range(2.7, 2.9))
	repeat(4)
	{
		instance_create_layer(x, y + 2, "effects", effectObj)
	}
}


if (dashPressed && (down) && dash && !global.isCutscene)
{
    dashTimer2 = 35
    yspeed = -8
	dashCooldown = 1211200;
	sprite_index = sprJump
	image_index = 80
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.6, 0, random_range(2.7, 2.9))
}

if (keyboard_check_pressed(ord("O")) && (down) && global.godmode)
{
    dashTimer2 = 35
    yspeed = -16
	dashCooldown = 1211200;
	sprite_index = sprJump
	image_index = 80
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.6, 0, random_range(2.7, 2.9))
}

if (dashTimer > 0)
{
    dashTimer -= dt
	
	if (xspeed > 0)
	{
		xspeed -= 0.2 * dt
	}
	instance_create_layer(x, y, "effects", dashEffect)
}

if (dashTimer <= 0)
{
	xspeed = 2
}

if (dashTimer2 > 0)
{
    dashTimer2 -= dt
	
	instance_create_layer(x, y, "effects", dashEffect)
}

if(abs(yspeed)>= 8)
{
	instance_create_layer(x, y, "effects", dashEffect)
}

if (dashCooldown > 0)
{
    dashCooldown -= dt;

    if (dashCooldown < 0)
        dashCooldown = 0;

    dash = false;
}
else
{
    dash = true;
}


if (place_meeting(x, y + 3, dashColObj) || place_meeting(x, y + 3, dashColStopDash) && dashing)
{
	
	
    if(dashTimer > 0)
	{
		dashTimer = 45;
		xspeed = 10;
	}
	
	if(dashTimer2 > 0 && yspeed > 0)
	{
		dashTimer2 = 45;
		yspeed = 10;
		repeat(4)
		{
			instance_create_layer(x, y + 2, "effects", effectObj)
		}
	}
	
	if(dashTimer2 > 0 && yspeed < 0)
	{
		dashTimer2 = 45;
		yspeed = -10;
		
		repeat(4)
		{
			instance_create_layer(x, y + 2, "effects", effectObjUp)
		}
	}
}

if (place_meeting(x, y, dashColObj) && (up || down || keyboard_check(global.key_left) || right))
{
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.2, 0, random_range(3, 3.2))
}

if (grounded && !was_grounded)
{
    dashCooldown = 0;
}





var dir = image_xscale;

if (place_meeting(x + dir, y, hitboxColObj) ||
    place_meeting(x + dir, y, hitboxColObjWall))
{
    dashTimer = 0;
    xspeed = 2;
    hsp = 0;
}

/*
if(place_meeting(x, y - yspeed * dt, hitboxColObj) && !grounded && !place_meeting(x + xspeed * dt, y - yspeed * dt, dashColObj))
{
	dashTimer = 0
	dashTimer2 = 0
	dashing = false
}
*/

if dashing && place_meeting(x - xspeed * dt, y - yspeed * dt, dashColStopDash)
{
	dashTimer = 0
	dashTimer2 = 0
	dashing = false
	
	xspeed = 2
	yspeed = yspeed / 2
}

if dashing && place_meeting(x - xspeed * dt, y - yspeed * dt, dashColWalkThrough) && !(keyboard_check(global.key_left) && keyboard_check(global.key_right))
{
	dashTimer2 = 45
	dashing = true
	dashCooldown = 0
	
	xspeed = 8
	yspeed = 10
	
	repeat(1)
	{
		instance_create_layer(x, y + 2, "effects", effectObj)
	}
}


if dashing && place_meeting(x - xspeed * dt, y - yspeed * dt, dashColWalkThrough) && (keyboard_check(global.key_left) && keyboard_check(global.key_right))
{
	dashTimer2 = 45
	dashing = true
	dashCooldown = 0
	
	xspeed = 8
	
	repeat(1)
	{
		instance_create_layer(x, y + 2, "effects", effectObj)
	}
}

if place_meeting(x, y, dashColWalkThrough) && (dashing || dashing2) && (up || down || left || right)
{
	audio_play_sound(DashSFX, 0.5, false, global.sfxVolume * 0.2, 0, random_range(3, 3.2))
}

if dashing && place_meeting(x - xspeed * dt, y - yspeed * dt, dashColWalkThrough) && keyboard_check(global.key_up)
{
	dashTimer2 = 45
	dashing = true
	dashCooldown = 0
	
	yspeed = 10
}

if dashing && place_meeting(x - xspeed * dt, y - yspeed * dt, dashColWalkThrough) && keyboard_check(global.key_down)
{
	dashTimer2 = 45
	dashing = true
	dashCooldown = 0
	
	yspeed = -10
}


if !up && !down && !left && !right && place_meeting(x, y, dashColObj)
{
	dashing2 = true
}

if !up && !down && !left && !right && !place_meeting(x, y, dashColObj)
{
	dashing = false
	dashTimer = 0
	dashTimer2 = 0
}

if !place_meeting(x, y, dashColObj) && dashing2 == true
{
	dashing2 = false
	dashing = false
	dashTimer = 0
	dashTimer2 = 0
	dashCooldown = 0
}


if dashing2
{
	xspeed = 2
}
//show_debug_message(dashing2)

/*
if(wallLeft || wallRight && !grounded && !place_meeting(x + xspeed * dt, y - yspeed * dt, dashColObj))
{
	dashTimer = 0
	dashTimer2 = 0
	dashing = false
}
*/

/*
if(place_meeting(x, y, dashColObj) && dashTimer > 0)
{
	dashTimer = 35
	dashCooldown = 100;
}
if(place_meeting(x, y, dashColObj) && dashTimer2 > 0)
{
	dashTimer2 = 35
	dashCooldown = 100;
}
*/

// Wall Jumping
// Wall Jumping
if (jumpPressed && !grounded && !global.isCutscene)
{
	if (wallLeft)
	{
		yspeed = jumpHeight;
		hsp = 8;
		sprite_index = sprJump;
		image_index = 3;
	}

	if (wallRight)
	{
		yspeed = jumpHeight;
		hsp = -8;
		sprite_index = sprJump;
		image_index = 3;
	}
}


// hsp horizontal movement
if (hsp != 0)
{
	var moveX = hsp * dt;

	if (!place_meeting(x + moveX, y, hitboxColObj) &&
	    !place_meeting(x + moveX, y, hitboxColObjWall))
	{
		x += moveX;
	}
	else
	{
		while (!place_meeting(x + sign(moveX), y, hitboxColObj) &&
		       !place_meeting(x + sign(moveX), y, hitboxColObjWall))
		{
			x += sign(moveX);
		}

		hsp = 0;
	}
}

hsp *= 0.85;

// Pause Menu
if (menuButtonPressed && pauseBuffer <= 0 && !global.isCutscene)
{
	
	pauseBuffer = 10
	
    if (instance_exists(obj_pause_menu))
    {
		with (obj_pause_menu)
		{
		    instance_destroy();
		}
    }
    else
    {
        instance_create_layer(0, 0, "managers", obj_pause_menu);
		
		
    }
}



// Misc 

movementSpeed = point_distance(previousX, previousX, x, x);

previousX = x;


//show_debug_message(pauseBuffer)

if (place_meeting(x, y, hitboxColObj))
{
    show_debug_message("INSIDE WALL");
    show_debug_message("x = " + string(x));
    show_debug_message("y = " + string(y));
    show_debug_message("yspeed = " + string(yspeed));
    show_debug_message("dt = " + string(dt));
}

//show_debug_message("Current Hat: " + string(global.hatSelected));

if global.lifes <= 0
{
			room_goto(MainMenu);
				if global.savageMod
				{
					room_goto(Room1_1)
				}
				else
				{
					room_goto(Room1)
				}
				playerObj.checkpointX = 64
				playerObj.checkpointY = 9928
				playerObj.x = playerObj.checkpointX
				playerObj.y = playerObj.checkpointY
				if !global.hoarderMod
				{
					global.points = 500
				}
				else
				{
					global.points = 5
				}
				global.lifes = 20
				global.levelLifes = true
				global.checkpointLifes = 20
				global.timer = 0
				audio_stop_all()	
				global.hasntDied = true
				global.checkpointGotten = false
				global.plusOneGotten = false
}



// godmode stuff

if global.godmode
{
	if keyboard_check_pressed(ord("P"))
	{
		global.godmode = !global.godmode
	}
}

if(sprite_index == sprJump && yspeed <= 0 && yspeed >= -0.6 && room == Room1)
{
    image_index = 57;
}
else if sprite_index == sprJump && yspeed <= 0 && yspeed >= -0.6
{
	image_index = 86;
}

if (!grounded && was_grounded && yspeed < 0 && (room == Room1|| room == Room1_1 || room == TitleRoom))
{
    sprite_index = sprJump;
    image_index = 57; // Falling frame
}
else if (!grounded && was_grounded && yspeed <= 0)
{
	sprite_index = sprJump;
    image_index = 86; // Falling frame
}
/*
if (!grounded && was_grounded && yspeed <= 0)
{
    sprite_index = sprJump;
    image_index = 57;
}
*/

if (!grounded && was_grounded)
{
    sprite_index = sprJump;
    image_index = 1;
}
else if (!grounded)
{
    sprite_index = sprJump;
}
else if (crouch)
{
    sprite_index = sprCrouch;
}
else if (left || right)
{
    sprite_index = sprMove;
}
else
{
    sprite_index = sprIdle;
}

was_grounded = grounded;

x = round(x);
y = round(y);