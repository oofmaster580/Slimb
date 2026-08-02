global.isCutscene = false
instance_create_layer(x, y, "JumboObj", jumboObj)
soundtrackManager.music = audio_play_sound(JumboTheGrandeSlime, 1, true, global.music_volume)
audio_resume_sound(soundtrackManager.music)
instance_destroy()