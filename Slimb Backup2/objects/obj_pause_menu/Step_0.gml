global.quotePos = pos

if (menuDelay > 0)
{
    menuDelay--;
}

option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Credits"
option[0, 3] = "Achievements"
option[0, 4] = "Modifiers"
option[0, 5] = "Return to homeworld"
option[0, 6] = "Start/Restart Playthrough"
option[0, 7] = "Quit Game"

option[1, 1] = "Brightness: " + string(round(global.brightness * 100)) + "%"
option[1, 0] = "Controls"
option[1, 2] = "Master Volume: " + string(round(global.master_volume * 100)) + "%"
option[1, 3] = "Music Volume: " + string(round(global.music_volume * 100)) + "%"
option[1, 4] = "SFX Volume: " + string(round(global.sfxVolume * 100)) + "%"

switch (global.bopAmount)
{
	case 0: option[1, 5] = "BPM Strength: OFF" break
	case 1: option[1, 5] = "BPM Strength: Small" break
	case 2: option[1, 5] = "BPM Strength: Small+" break
	case 3: option[1, 5] = "BPM Strength: Moderate" break
	case 4: option[1, 5] = "BPM Strength: Moderate+" break
	case 5: option[1, 5] = "BPM Strength: Large" break
	case 6: option[1, 5] = "BPM Strength: Large+" break
}

switch (global.resolution)
{
	case 1: option[1, 6] = "Resolution: x1" break
	case 2: option[1, 6] = "Resolution: x2" break
	case 3: option[1, 6] = "Resolution: x3" break
	case 4: option[1, 6] = "Resolution: x4" break
}

switch (global.freeCamSpeed)
{
	case 1: option[1, 7] = "Free Cam Speed: Slow" break
	case 2: option[1, 7] = "Free Cam Speed: Moderate" break
	case 3: option[1, 7] = "Free Cam Speed: Fast" break
	case 4: option[1, 7] = "Free Cam Speed: Speedy" break
}

option[1, 8] = "ViewPort Size: " + string(round((global.zoomControl * 100) - 10)) + "%"

option[1, 9] = "Back"

option[2, 0] = "Coding - PrimarySuspect"
option[2, 1] = "Art - PrimarySuspect"
option[2, 2] = "Music - PrimarySuspect"
option[2, 3] = "Level Design - PrimarySuspect"
option[2, 4] = "Sound Design - PrimarySuspect"
option[2, 5] = "(yes i did all of this myself)"
option[2, 6] = "Back"

option[3,0] = "Jump/select: " + key_name(global.key_jump)
option[3,1] = "Dash: " + key_name(global.key_dash)
option[3,2] = "Up: " + key_name(global.key_up)
option[3,3] = "Down: " + key_name(global.key_down)
option[3,4] = "Left: " + key_name(global.key_left)
option[3,5] = "Right: " + key_name(global.key_right)
option[3,6] = "Reset: " + key_name(global.key_reset)
option[3,7] = "Interact: " + key_name(global.key_interact)
option[3,8] = "Free Camera: " + key_name(global.key_freeCamera)

if global.controllerConnected == -1
{
	option[3,9] = "click m to reset changes"
}
else
{
	option[3,9] = "controller support not implented yet!"
}

option[3,10] = "Back"

// Modifiers

if (array_contains(global.hatsUnlocked, 11) || array_contains(global.hatsUnlocked, 10))
{
	if global.impatientMod
	{
		option[7,2] = "Showoff - Must perfect; ON"
	}
	else
	{
		option[7,2] = "Showoff - Must perfect; OFF"
	}
}
else
{
	option[7,2] = "Showoff - LOCKED"
}
if global.mostPoints >= 400000
{
	if global.hoarderMod
	{
		option[7,0] = "Hoarder - If your points reach zero, you lose all lives; ON"
	}
	else
	{
		option[7,0] = "Hoarder - If your points reach zero, you lose all lives; OFF"
	}
}
else
{
	option[7,0] = "Hoarder - LOCKED"
}
if global.mostPoints >= 600000
{
	if global.bankruptMod 
	{
		option[7,1] = "Bankrupt - Coins Kill; ON"
	}
	else
	{
		option[7,1] = "Bankrupt - Coins Kill; OFF"
	}
}
else
{
	option[7,1] = "bankrupt - LOCKED"
}

if global.gameBeat
{
	if global.heavyMod 
	{
		option[7,4] = "Heavy - Can't move unless dashing or ungrounded; ON"
	}
	else
	{
		option[7,4] = "Heavy - Can't move unless dashing or ungrounded; OFF"
	}
}
else
{
	option[7,4] = "Heavy - LOCKED"
}

if global.gameBeat
{
	if global.savageMod 
	{
		option[7,5] = "Savage - New Game+; ON"
	}
	else
	{
		option[7,5] = "Savage - New Game+; OFF"
	}
}
else
{
	option[7,5] = "Savage - LOCKED"
}



if array_contains(global.hatsUnlocked, 12)
{
	if global.excMod
	{
		option[7,3] = "Excruciating - One Life; ON"
	}
	else
	{
		option[7,3] = "Excruciating - One Life; OFF"
	}
}
else
{
	option[7,3] = "Excruciating - LOCKED"
}

//

if !array_contains(global.hatsUnlocked, 1)
{
	option[4,0] = "Spike Pin - Complete Fieldifur"
}
else
{
	option[4,0] = "Spike Pin - Complete Fieldifur - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 2)
{
	option[4,1] = "Seedling - Perfect Fieldifur"
}
else
{
	option[4,1] = "Seedling - Perfect Fieldifur - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 3)
{
	option[4,2] = "Top Hat - No Checkpoints Thornaballia"
}
else
{
	option[4,2] = "Top Hat - No Checkpoints Thornaballia - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 4)
{
	option[4,3] = "Rocky - No Deaths Thornaballia"
}
else
{
	option[4,3] = "Rocky - No Deaths Thornaballia - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 5)
{
	option[4,4] = "Top Hat Hat - Perfect Thornaballia"
}
else
{
	option[4,4] = "Top Hat Hat - Perfect Thornaballia - COMPLETE"
}

option[4,5] = "Next"
option[4,6] = "Back"

if !array_contains(global.hatsUnlocked, 6)
{
	option[5,0] = "Checkpoint San - No Checkpoints Bramblemire"
}
else
{
	option[5,0] = "Checkpoint San - No Checkpoints Bramblemire - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 7)
{
	option[5,1] = "Leaf Crown - No Deaths Bramblemire"
}
else
{
	option[5,1] = "Leaf Crown - No Deaths Bramblemire - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 8)
{
	option[5,2] = "Thorn Crown - Perfect Bramblemire"
}
else
{
	option[5,2] = "Thorn Crown - Perfect Bramblemire - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 9)
{
	option[5,3] = "Devil Horns - Reach bramblemire on one life"
}
else
{
	option[5,3] = "Devil Horns - Reach bramblemire on one life - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 10)
{
	option[5,4] = "Angel Halo - Beat bramblemire on one life"
}
else
{
	option[5,4] = "Angel Halo - Beat bramblemire on one life - COMPLETE"
}

option[5,5] = "Next"
option[5,6] = "Back"

if !array_contains(global.hatsUnlocked, 11)
{
	option[6,0] = "Antenna - Beat Hoarder"
}
else
{
	option[6,0] = "Antenna - Beat Hoarder - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 12)
{
	option[6,1] = "Piggy Bank - Beat Bankrupt"
}
else
{
	option[6,1] = "Piggy Bank - Beat Bankrupt - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 13)
{
	option[6,2] = "Bow - Beat Showoff"
}
else
{
	option[6,2] = "Bow - Beat Showoff - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 14)
{
	option[6,3] = "Funeral Hat - Beat Excruciating"
}
else
{
	option[6,3] = "Funeral Hat - Beat Excruciating - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 15)
{
	option[6,4] = "Crown - Beat Heavy"
}
else
{
	option[6,4] = "Crown - Beat Heavy - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 16)
{
	option[6,5] = "Fallen Angel - Beat Savage"
}
else
{
	option[6,5] = "Fallen Angel - Beat Savage - COMPLETE"
}

option[6,6] = "Next"
option[6,7] = "Back"

if !array_contains(global.hatsUnlocked, 17)
{
	option[8,0] = "Flower - Find the hidden flower"
}
else
{
	option[8,0] = "Flower - Find the hidden flower - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 18)
{
	option[8,1] = "Bowler Hat - Beat the game under par time"
}
else
{
	option[8,1] = "Bowler Hat - Beat the game under par time - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 19)
{
	option[8,2] = "Sign - ???"
}
else
{
	option[8,2] = "Sign - Die 50 times - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 20)
{
	option[8,3] = "Jester's Hat - ???"
}
else
{
	option[8,3] = "Jester's Hat - Die 100 times - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 21)
{
	option[8,4] = "Dunce - ???"
}
else
{
	option[8,4] = "Dunce - Waste time in fieldifur - COMPLETE"
}

option[8,5] = "Next"
option[8,6] = "Back"

if !array_contains(global.hatsUnlocked, 22)
{
	option[9,0] = "Sleep Cap - ???"
}
else
{
	option[9,0] = "Sleep Cap - Stay Idle for 5 minutes - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 23)
{
	option[9,1] = "Propeller Hat - ???"
}
else
{
	option[9,1] = "Propeller Hat - Reach the highest possible point - COMPLETE"
}

if !array_contains(global.hatsUnlocked, 24)
{
	option[9,2] = "Slime Pet - ???"
}
else
{
	option[9,2] = "Slime Pet - Collect all cosmetics - COMPLETE"
}

option[9,3] = "Back"





// get input

pad = global.gamepad;

up_key =
    keyboard_check_pressed(global.key_up) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padu)
    ));

down_key =
    keyboard_check_pressed(global.key_down) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padd)
    ));

accept_key =
    keyboard_check_pressed(global.key_jump) ||
    (pad != -1 && gamepad_button_check_pressed(pad, gp_face1));

left_key =
    keyboard_check_pressed(global.key_left) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padl)
    ));

right_key =
    keyboard_check_pressed(global.key_right) ||
    (pad != -1 && (
        gamepad_button_check_pressed(pad, gp_padr)
    ));
	
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

//show_debug_message("BOP: " + string(global.bopAmount))

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
			case 0: instance_destroy() break
		
			// settings
			case 1: menu_level = 1 break
		
			// credits
			case 2: menu_level = 2 break
		
			// Achievements
			case 3: menu_level = 4 audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			
			// Modifiers 
			case 4: menu_level = 7 audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		
			// Return to homeworld
			case 5: 
				room_goto(MainMenu);
				room_goto(TitleRoom)
				playerObj.checkpointX = 96
				playerObj.checkpointY = 296
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
				global.checkpointGotten = false
				global.hasntDied = true
				global.plusOneGotten = false
				
				soundtrackManager.music = audio_play_sound(Slimb, 1, true, global.music_volume * 2);
				
				global.hasntDied = false
				global.checkpointGotten = false
				global.plusOneGotten = false
			
			break
			
			// Restart Playthrough
			case 6:
				global.checkpointGotten = false
				global.hasntDied = true
				global.plusOneGotten = false
			
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
			break
			
			// exit game
			case 7: game_end() break
		}
		break
		
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
			
			audio_play_sound(menuSFX, 1, false, global.sfxVolume)
		    break;
			
			// Master Volume
			case 2: break
			
			// Music Volume
			case 3: break
			
			// SFX Volume
			case 4: break

			case 5:
				switch (global.bopAmount)
				{
					case 0:
						global.bopAmount = 1
					break
					
					case 1:
						global.bopAmount = 2
					break
					
					case 2:
						global.bopAmount = 3
					break
					
					case 3:
						global.bopAmount = 4
					break
					
					case 4:
						global.bopAmount = 5
					break
					
					case 5:
						global.bopAmount = 6
					break
					
					case 6:
						global.bopAmount = 0
					break
				}
			break
			
			case 6:
				switch (global.resolution)
				{
					case 1: 
						global.resolution = 2
						window_set_size(720 * global.resolution, 480 * global.resolution);
						window_center()
					break
					
					case 2: 
						global.resolution = 3
						window_set_size(720 * global.resolution, 480 * global.resolution);
						window_center()
					break
					
					case 3: 
						global.resolution = 4
						window_set_size(720 * global.resolution, 480 * global.resolution);
						window_center()
					break
					
					case 4: 
						global.resolution = 1
						window_set_size(720 * global.resolution, 480 * global.resolution);
						window_center()
					break
				}
				break
				
			case 7:
				switch (global.freeCamSpeed)
				{				
					case 1:
						global.freeCamSpeed = 2
					break
					
					case 2:
						global.freeCamSpeed = 3
					break
					
					case 3:
						global.freeCamSpeed = 4
					break
					
					case 4:
						global.freeCamSpeed = 1
					break
				}
			break
			
			// Back
			case 9:
		    menu_level = 0;
			break;
		}
		break
		
		case 2:
		switch(pos)
		{
			case 0: break

			case 1: break

			case 2: break

			case 3: break

			case 4: break
			
			case 5: break
			
			case 6: menu_level = 0  break
		}
		break
		
		case 3:
		switch(pos)
		{
		    case 0:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 1:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 2:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 3:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 4:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;

			case 5:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 6:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 7:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 8:
			
			if (menuDelay <= 0 && accept_key && global.controllerConnected == -1)
			{
				waiting_for_key = true;
				rebindBuffer = 5;
				audio_play_sound(menuSFX, 1, false)
			}
			
			break;
			
			case 9:
			
			resetControls()	
			
			break;
			
			case 10: menu_level = 0 audio_play_sound(menuSFX, 1, false) break;
		}
		break
		
		case 4:
		switch(pos)
		{
			case 5: menu_level = 5; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			case 6: menu_level = 0; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 5:
		switch(pos)
		{
			case 5: menu_level = 6; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			case 6: menu_level = 4; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 6:
		switch(pos)
		{
			case 6: menu_level = 8; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			case 7: menu_level = 5; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 8:
		switch(pos)
		{
			case 5: menu_level = 9; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
			case 6: menu_level = 6; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 9:
		switch(pos)
		{
			case 3: menu_level = 8; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break
		
		case 7:
		switch(pos)
		{
			case 0: 
			if room == TitleRoom && global.mostPoints >= 400000
			{
				global.hoarderMod = !global.hoarderMod
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			 
			
			break

			case 1: 
			if room == TitleRoom && global.mostPoints >= 600000
			{
				global.bankruptMod = !global.bankruptMod 
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			
			break
			case 2: 
			if room == TitleRoom && (array_contains(global.hatsUnlocked, 11) || array_contains(global.hatsUnlocked, 10))
			{
				global.impatientMod = !global.impatientMod 
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			
			break
			
			case 3: 
			if room == TitleRoom && array_contains(global.hatsUnlocked, 12)
			{
				global.excMod = !global.excMod 
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			break
			
			case 4: 
			if room == TitleRoom && global.gameBeat
			{
				global.heavyMod = !global.heavyMod 
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			break
			
			case 5: 
			if room == TitleRoom && global.gameBeat
			{
				global.savageMod = !global.savageMod 
				audio_play_sound(menuSFX, 1, false, global.sfxVolume)
			}
			break

			case 6: menu_level = 0; audio_play_sound(menuSFX, 1, false, global.sfxVolume) break
		}
		break // && array_contains(global.hatsUnlocked, 12)
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
			
			break
			
			// Controls
			case 0: break
			
			// Master Volume
			case 2: 
			global.master_volume += (right_key - left_key) * 0.1;
			global.master_volume = clamp(global.master_volume, 0, 2);

			audio_master_gain(global.master_volume);
			break
			
			// Music Volume
			case 3: 
			global.music_volume += (right_key - left_key) * 0.1;
			global.music_volume = clamp(global.music_volume, 0, 2);

			audio_sound_gain(soundtrackManager.music, global.music_volume, 0);
			audio_sound_gain(justunpausethegamealready, global.music_volume, 0)
			break

			// SFX Volume
			case 4:
			global.sfxVolume += (right_key - left_key) * 0.1;
			global.sfxVolume = clamp(global.sfxVolume, 0, 2);

			audio_sound_gain(soundtrackManager.music, global.sfxVolume, 0);
			break
			
			case 8:
			global.zoomControl += (right_key - left_key) * 0.01;
			global.zoomControl = clamp(global.zoomControl, 0.1, 2.1);
			
			with (windowManager)
			{
				my_crt
				    .configure_ntsc(false)
				    .configure_geometry({
				        content_width: 480,
				        content_height: 270,
				        aspect_ratio: 16/9,
				        zoom: global.zoomControl,
				        border_width: 0.0,
				        curvature: 0.1,
				        do_int_scale: true
				    })
			}

			audio_sound_gain(soundtrackManager.music, global.sfxVolume, 0);
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

if keyboard_check_pressed(vk_escape)
{
	instance_destroy()
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

function key_name(_key)
{
    switch (_key)
    {
        case vk_space:      return "Space";
        case vk_enter:      return "Enter";
        case vk_shift:      return "Shift";
        case vk_control:    return "Ctrl";
        case vk_escape:     return "Esc";
        case vk_tab:        return "Tab";
        case vk_backspace:  return "Backspace";
        default:            return chr(_key);
    }
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