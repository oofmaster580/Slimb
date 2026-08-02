switch (room)
{
	case TitleRoom:  
		if place_meeting(x, y, playerObj) && playerObj.interact
		{
			playerObj.x = 88
			playerObj.y = 9928
			
			camera_set_view_pos(
			    view_camera[0],
			    playerObj.x,
			    playerObj.y
			);
			
			playerObj.checkpointX = playerObj.x
			playerObj.checkpointY = playerObj.yspeed
			
			global.levelLifes = true
			global.hasntDied = false
			global.checkpointGotten = false
			global.plusOneGotten = false
			
			
			if !global.savageMod
			{
				room_goto(Room1)
			}
			else
			{
				room_goto(Room1_1)
			}
		}
	break
	
	case Room1: 
	case Room1_1: 
		if place_meeting(x, y, playerObj) && playerObj.interact
		{
			
			
			playerObj.checkpointX = playerObj.x
			playerObj.checkpointY = playerObj.y
			
			camera_set_view_pos(
			    view_camera[0],
			    playerObj.x,
			    playerObj.y
			);
			
			if global.hasntDied {global.points += 5000 * global.pointMult}
			if global.timer < global.roomTime {global.points += 10000 * global.pointMult}
			
			global.points += global.lifes * 100 * global.pointMult
			
			AchievementManager.Achievement(1)
			
			if global.plusOneGotten && !global.hasntDied && !global.checkpointGotten && global.timer < global.roomTime
			{
				global.points += 15000 * global.pointMult
				AchievementManager.Achievement(2)
			}
			
			global.levelLifes = true
			global.hasntDied = false
			global.checkpointGotten = false
			global.plusOneGotten = false
			
			
			if !global.savageMod
			{
				room_goto(Room2)
			}
			else
			{
				room_goto(Room2_1)
			}
		}
	break
	
	case Room2: 
	case Room2_1: 
		if place_meeting(x, y, playerObj) && playerObj.interact
		{
			playerObj.x = 96
			playerObj.y = 8000
			
			playerObj.checkpointX = playerObj.x
			playerObj.checkpointY = playerObj.y
			
			camera_set_view_pos(
			    view_camera[0],
			    playerObj.x,
			    playerObj.y
			);
			
			if global.hasntDied {global.points += 10000 * global.pointMult}
			if global.timer < global.roomTime {global.points += 250000 * global.pointMult}
			
			global.points += global.lifes * 200 * global.pointMult
			
			if global.plusOneGotten && !global.hasntDied && !global.checkpointGotten && global.timer < global.roomTime
			{
				global.points += 35000 * global.pointMult
				AchievementManager.Achievement(5)
			}
			
			if !global.checkpointGotten
			{
				AchievementManager.Achievement(3)
			}
			
			if global.hasntDied
			{
				AchievementManager.Achievement(4)
			}
			
			if global.lifes == 1
			{
				AchievementManager.Achievement(9)
			}
			
			global.levelLifes = true
			global.hasntDied = false
			global.checkpointGotten = false
			global.plusOneGotten = false
			
			
			if !global.savageMod
			{
				room_goto(Room3)
			}
			else
			{
				room_goto(Room3_1)
			}
		}
	break
	
	case Room3: 
	case Room3_1: 
		if place_meeting(x, y, playerObj) && playerObj.interact
		{
			playerObj.x = 96
			playerObj.y = 296
			camera_set_view_pos(
			    view_camera[0],
			    playerObj.x,
			    playerObj.y
			);
			
			playerObj.checkpointX = playerObj.x
			playerObj.checkpointY = playerObj.y
			
			if global.hasntDied {global.points += 10000 * global.pointMult}
			if global.timer < global.roomTime {global.points += 250000 * global.pointMult}
			
			global.points += global.lifes * 200 * global.pointMult
			
			if global.plusOneGotten && !global.hasntDied && !global.checkpointGotten && global.timer < global.roomTime
			{
				global.points += 50000 * global.pointMult
				AchievementManager.Achievement(8)
			}
			
			if !global.checkpointGotten
			{
				AchievementManager.Achievement(6)
			}
			
			if global.hasntDied
			{
				AchievementManager.Achievement(7)
			}
			
			if global.lifes == 1
			{
				AchievementManager.Achievement(10)
			}
			
			if global.hoarderMod
			{
				AchievementManager.Achievement(11)
			}
			
			if global.bankruptMod
			{
				AchievementManager.Achievement(12)
			}
			
			if global.impatientMod
			{
				AchievementManager.Achievement(13)
			}
			
			if global.excMod
			{
				AchievementManager.Achievement(14)
			}
			
			if global.heavyMod
			{
				AchievementManager.Achievement(15)
			}
			
			if global.savageMod
			{
				AchievementManager.Achievement(16)
			}
			
			if global.points > global.mostPoints
			{
				global.mostPoints = global.points
			}
			
			if (global.timer < global.bestTime || global.bestTime == 0)
			{
				global.bestTime = global.timer
			}
			
			global.levelLifes = true
			global.hasntDied = false
			global.checkpointGotten = false
			global.plusOneGotten = false
			
			global.gameBeat = true
			
			global.timer = 0
			global.points = 0
			
			audio_stop_all()
			soundtrackManager.music = audio_play_sound(Slimb, 1, true, global.music_volume)
			room_goto(TitleRoom)
		}
	break
}