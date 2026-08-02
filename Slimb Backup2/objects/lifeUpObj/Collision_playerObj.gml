audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 2, 0, random_range(0.9, 1.1))
global.checkpointProtection++;
global.plusOneGotten = true

modifiersMult = global.pointMult

if global.hoarderMod
{
	global.points += 10
}

if !global.hoarderMod
{
	switch(room)
	{	
		case Room1:
		case Room1_1:
		{
			global.points += ceil(5000 * global.pointMult)
		}
		break;

		case Room2:
		case Room2_1:
		{
			global.points += ceil(15000 * global.pointMult)
		}
		break;
	
		case Room3:
		case Room3_1:
		{
			global.points += ceil(30000 * global.pointMult)
		}
		break;
	}
}

switch(room)
	{
		case TitleRoom:
		{
			global.hatsUnlocked = [0]
			global.deaths = 0
			global.gameBeat = false
			global.hatSelected = 0
			global.mostPoints = 0
			global.bestTime = 0
			global.amountRuns = 0
			
			global.excMod = false
			global.bankruptMod = false
			global.heavyMod = false
			global.hoarderMod = false
			
			global.talkedInvisDialogue = [0]
		}
	}

instance_destroy()