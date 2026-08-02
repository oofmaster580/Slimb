if (place_meeting(x, y, playerObj))
{
    with (lifeUpObj)
    {
        if (pairID == other.pairID)
        {
			audio_play_sound(deathSFX, 0.5, false, global.sfxVolume * 3.5, 0, random_range(0.3, 0.4))
            instance_destroy();
        }
    }
}

image_alpha = 0