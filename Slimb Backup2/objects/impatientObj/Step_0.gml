if global.timer > global.roomTime && global.impatientMod
{
	room_goto(MainMenu);
				room_goto(Room1)
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