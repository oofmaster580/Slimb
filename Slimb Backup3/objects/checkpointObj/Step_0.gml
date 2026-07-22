if(place_meeting(x, y, playerObj) && keyboard_check_pressed(global.key_interact) && !place_meeting(x, y, signObj) && (global.checkpointID != ID) && ID != -1)
{
	playerObj.checkpointX = x
	playerObj.checkpointY = y 
	global.checkpointGotten = true
	global.checkpointID = ID
	
	if (global.lifes != global.checkpointLifes && !global.checkpointProtection)
	{
		global.lifes -= 5;
		audio_play_sound(deathSFX, 0.5, false, 2, 0, random_range(0.9, 1.1))
		global.checkpointLifes = global.lifes
	}
	
	audio_play_sound(deathSFX, 0.5, false, 2, 0, random_range(0.9, 1.1))
	
	if(global.checkpointProtection > 0 && (global.lifes != global.checkpointLifes))
	{
		global.checkpointProtection--;
	}
}