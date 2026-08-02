if place_meeting(x, y, playerObj)
{
	image_index = 1
	
	if playerObj.interact
	{
	    var startHat = global.hatSelected;
	    var nextHat = global.hatSelected;
		
		audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 3, 0, random_range(1.6, 1.7))
		
		repeat(40)
		{
			instance_create_layer(playerObj.x, playerObj.y + 2, "managers", effectObjRandom)
		}

	    repeat(sprite_get_number(hats))
	    {
	        nextHat++;

	        if (nextHat >= sprite_get_number(hats))
	        {
	            nextHat = 0;
	        }

	        if (array_contains(global.hatsUnlocked, nextHat))
	        {
	            global.hatSelected = nextHat;
	            break;
	        }
	    }
	}
}
else
{
	image_index = 0
}


if global.hatSelected >= sprite_get_number(hats)
{
	global.hatSelected = 0
}



/*
global.hatsUnlocked = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]
global.gameBeat = true
global.deaths = 50
global.mostPoints = 1000000
*/

//global.hatsUnlocked = [0,1,2,3,4,5,6,7,8,9]
//global.hatsUnlocked = [0]
//global.deaths = 0

if global.hatsUnlocked == []
{
	global.hatsUnlocked = [0]
}