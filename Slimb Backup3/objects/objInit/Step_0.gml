timer--;

if (timer <= 0)
{
	global.brightness = 1;
	global.master_volume = 1
	global.music_volume = 1
	global.sfxVolume = 1

	global.key_up = ord("W");
	global.key_down = ord("S");
	global.key_left = ord("A");
	global.key_right = ord("D");
	global.key_jump = ord("J");
	global.key_dash = ord("I");
	global.key_reset = ord("R");
	global.key_interact = ord("E");
	
    room_goto(MainMenu);
}