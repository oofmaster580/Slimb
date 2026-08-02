function killPlayerDefault()
{ 
	if !global.godmode
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
	
		playerObj.x = playerObj.checkpointX
		playerObj.y = playerObj.checkpointY
		playerObj.yspeed = playerObj.yspeed / 4
	
		audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
		global.deaths++
	}
}
