music = audio_play_sound(Slimb, 1, true, global.music_volume);

audio_master_gain(global.master_volume);

global.resumeMusicTimer = 0;
global.musicBPM = 150; // Change for each song
global.beatOffset = 0.30; // Time in seconds until the first beat
global.chorus = 0
global.chorusEnd = 999999

lastBeat = -1;
