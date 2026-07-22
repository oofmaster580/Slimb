if instance_exists(obj_pause_menu) return;

mask_index = JumboSpriteIdle

function SetState(_state)
{
    state = _state;
    stateTimer = 0;
}

stateTimer++;

grounded = place_meeting(x, y + 1, hitboxColObj);

// Landed this frame
if (grounded && !wasGrounded)
{
    with (cameraManager)
    {
        shake = 20;
		shakeFade = 0.9
		audio_play_sound(jumboJump, 0.5, false, global.sfxVolume, 0, random_range(0.3, 0.6))
    }
	global.throwUpPlayer = 3
}

wasGrounded = grounded;

switch (state)
{
    case 1:
	if grounded
	{
        sprite_index = JumboSpriteIdle;
	}

        if (stateTimer >= 2 * game_get_speed(gamespeed_fps))
        {
            SetState(2);
        }
    break;

    case 2: // Windup
    sprite_index = JumboSpriteJump;
    yspeed = 0;

    if (stateTimer >= 20) // wait 20 frames
    {
        SetState(3);
    }
	break;

	case 3: // Jump
	    sprite_index = JumboSpriteJump;
		
		jumpTimes++
		
	    yspeed = ceil(random_range(-8, -6));
		if xspeed > 0
		{
			xspeed = ceil(random_range(4, 5));
		}
		
		if xspeed < 0
		{
			xspeed = -ceil(random_range(4, 5));
		}
		
		startedFalling = false;
	    SetState(4);
	break;

	case 4: // In air
	    sprite_index = JumboSpriteJump;
		
		if (yspeed > 0 && !startedFalling)
		{
		    image_index = 76;
		    startedFalling = true;
		}
		
	    if (grounded)
		{
		    image_index = 0;
		    startedFalling = false;
		    image_speed = 1;

		    if (jumpTimes < 3)
		    {
		        SetState(2); // Immediately wind up for the next jump
		    }
		    else
		    {
		        jumpTimes = 0;
		        SetState(5); // Finished all 3 jumps
		    }
		}
	break;
	
	case 5: // Windup Goop
	sprite_index = JumboSpriteIdle;
    yspeed = 0;

    if (stateTimer >= 20) // wait 20 frames
    {
        SetState(6);
    }
	break;
	
	case 6: // Shoot Goop
	    sprite_index = JumboSpriteIdle;

	    if (stateTimer % 10 == 1 && stateTimer <= 40)
	    {
	        instance_create_layer(x + 64, y + 64, "JumboObj", obj_slimeball1);
			audio_play_sound(deathSFX, 0.25, false, global.sfxVolume)
	    }

	    if (stateTimer >= 45)
	    {
	        SetState(1);
	    }
	break;
}

show_debug_message(jumpTimes)

if (!place_meeting(x, y + yspeed, hitboxColObj))
{
    y += yspeed;
    yspeed += yGravity;
}
else
{
    yspeed = 0;
}

if (!grounded)
{
    if (!place_meeting(x + xspeed, y, hitboxColObjWall))
    {
        x += xspeed;
    }
    else
    {
        xspeed = -xspeed;
    }
}

if !global.godmode
{
	if x > room_width / 2
	{
		if(place_meeting(x, y, playerObj) && !global.isCutscene)
		{
		
			global.hasntDied = false
			global.diedThisGame = true
	
			global.lifes = max(0, global.lifes - 1);
			if !global.hoarderMod
			{
				global.points -= 100
			}
			global.levelLifes = false
			global.hasntDied = false
	
			instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
			playerObj.x = 88
			playerObj.y = 248
			playerObj.yspeed = playerObj.yspeed / 4
	
			audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
			global.deaths++
		}
	}
	else if x < room_width / 2
	{
		if(place_meeting(x, y, playerObj) && !global.isCutscene)
		{
		
			global.hasntDied = false
			global.diedThisGame = true
	
			global.lifes = max(0, global.lifes - 1);
			if !global.hoarderMod
			{
				global.points -= 100
			}
			global.levelLifes = false
			global.hasntDied = false
	
			instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
			playerObj.x = 392
			playerObj.y = 248
			playerObj.yspeed = playerObj.yspeed / 4
	
			audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
			global.deaths++
		}
	}
}

