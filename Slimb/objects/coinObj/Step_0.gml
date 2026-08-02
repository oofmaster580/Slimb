global.pointMult = 1 + global.excMod + global.bankruptMod + global.impatientMod + global.hoarderMod + (global.savageMod * 3) + global.heavyMod
modifiersMult = global.pointMult

if (instance_exists(dialogBoxObj) || instance_exists(obj_pause_menu) || global.cameraLook)
{
	image_speed = 0
}
else
{
	image_speed = 1
}


if place_meeting(x, y, playerObj) && !global.bankruptMod && !global.hoarderMod
{
	
	global.points += 100 * ceil(modifiersMult)

	instance_destroy()
	audio_play_sound(menuSFX, 0.3, false, global.sfxVolume * 0.7, 0, random_range(1.7, 1.75))
}

if place_meeting(x, y, playerObj) && global.hoarderMod
{
	
	global.points++

	instance_destroy()
	audio_play_sound(menuSFX, 0.3, false, global.sfxVolume * 0.7, 0, random_range(1.7, 1.75))
}

if !global.godmode
{
	if(place_meeting(x, y, playerObj) && global.bankruptMod)
	{
		
		global.hasntDied = false
		global.diedThisGame = true
	
		global.lifes = max(0, global.lifes - 1);
		
		global.points += 100 * ceil(modifiersMult)
		
		global.levelLifes = false
		global.hasntDied = false
	
		instance_create_layer(playerObj.x, playerObj.y, "Player", DeathObj)
	
		playerObj.x = playerObj.checkpointX
		playerObj.y = playerObj.checkpointY
		playerObj.yspeed = playerObj.yspeed / 4
	
		audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
		global.deaths++
		
	}
}
