if !global.godmode
{
	if(place_meeting(x, y, playerObj) && !global.isCutscene)
	{
		killPlayerDefault()
	}
}



image_alpha = 0