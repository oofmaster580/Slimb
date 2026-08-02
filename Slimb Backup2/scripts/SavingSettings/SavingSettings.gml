function saveControls(){
	
	ini_open("controls.ini");

	ini_write_real("Controls", "Left",  global.key_left);
	ini_write_real("Controls", "Right", global.key_right);
	ini_write_real("Controls", "Up",  global.key_up);
	ini_write_real("Controls", "Down", global.key_down);
	ini_write_real("Controls", "Jump",  global.key_jump);
	ini_write_real("Controls", "Dash",  global.key_dash);
	ini_write_real("Controls", "Reset",  global.key_reset);
	ini_write_real("Controls", "Interact",  global.key_interact);
	ini_write_real("Controls", "Free Camera",  global.key_freeCamera);

	ini_close();

}

function loadControls()
{
    ini_open("controls.ini");

    global.key_left  = ini_read_real("Controls", "Left",  ord("A"));
    global.key_right = ini_read_real("Controls", "Right", ord("D"));
	global.key_up  = ini_read_real("Controls", "Up",  ord("W"));
    global.key_down = ini_read_real("Controls", "Down", ord("S"));
    global.key_jump  = ini_read_real("Controls", "Jump",  ord("J"));
    global.key_dash  = ini_read_real("Controls", "Dash",  ord("I"));
	global.key_reset = ini_read_real("Controls", "Reset",  ord("R"));
	global.key_interact = ini_read_real("Controls", "Interact",  ord("E"));
	global.key_freeCamera = ini_read_real("Controls", "Free Camera",  vk_space);

    ini_close();
}

function resetControls()
{
	global.key_up = ord("W")
	global.key_down = ord("S")
	global.key_left = ord("A")
	global.key_right = ord("D")
	global.key_jump = ord("J")
	global.key_dash = ord("I")
	global.key_reset = ord("R")
	global.key_interact = ord("E")
	global.key_freeCamera = vk_space
	
	audio_play_sound(menuSFX, 0.5, false, global.sfxVolume * 0.7)
}

function saveSettings()
{
	ini_open("settings.ini");

	ini_write_real("Settings", "Brightness",  global.brightness);
	ini_write_real("Settings", "MasterVolume",  global.master_volume);
	ini_write_real("Settings", "SfxVolume",  global.sfxVolume);
	ini_write_real("Settings", "MusicVolume",  global.music_volume);
	ini_write_real("Settings", "zoomControl",  global.zoomControl);
	
	ini_write_real("Misc", "Hats", global.hatSelected);
	ini_write_string("Misc", "HatsUnlocked", json_stringify(global.hatsUnlocked));
	ini_write_string("Misc", "talkedInvisDialogue", json_stringify(global.talkedInvisDialogue));
	ini_write_string("Misc", "Deaths", global.deaths);
	ini_write_string("Misc", "bestTime", global.bestTime);
	ini_write_string("Misc", "mostPoints", global.mostPoints);
	ini_write_string("Misc", "amountRuns", global.amountRuns);
	ini_write_string("Misc", "gameBeat", global.gameBeat);
	ini_write_string("Misc", "gameBooted", global.gameBooted);
	
	ini_write_string("Modifiers", "painful", global.hoarderMod);
	ini_write_string("Modifiers", "greedy", global.bankruptMod);
	ini_write_string("Modifiers", "impatient", global.impatientMod);
	ini_write_string("Modifiers", "excruciating", global.excMod);
	ini_write_string("Modifiers", "heavy", global.heavyMod);
	ini_write_string("Modifiers", "savage", global.savageMod);
	
	ini_write_string("Screen", "fullScreen", global.fullScreen);
	ini_write_string("Screen", "bopAmount", global.bopAmount);
	ini_write_string("Screen", "resolution", global.resolution);
	ini_write_string("Screen", "freeCamSpeed", global.freeCamSpeed);
	
	ini_close();
}

function loadSettings()
{
    ini_open("settings.ini");

    global.brightness = ini_read_real("Settings", "Brightness", 1);
    global.master_volume = ini_read_real("Settings", "MasterVolume", 1);
    global.sfxVolume = ini_read_real("Settings", "SfxVolume", 1);
	global.music_volume = ini_read_real("Settings", "MusicVolume", 1);
	global.zoomControl = ini_read_real("Settings", "zoomControl", 1.1);
	
    global.hatSelected = ini_read_real("Misc", "Hats", 0);
	global.deaths = ini_read_real("Misc", "Deaths", 0);
	global.bestTime = ini_read_real("Misc", "bestTime", 0.0);
	global.mostPoints = ini_read_real("Misc", "mostPoints", 0);
	global.amountRuns = ini_read_real("Misc", "amountRuns", 0);
	global.gameBeat = ini_read_real("Misc", "gameBeat", false);
	global.gameBooted = ini_read_real("Misc", "gameBooted", false);
	
	global.hoarderMod = ini_read_real("Modifiers", "painful", false);
	global.bankruptMod = ini_read_real("Modifiers", "greedy", false);
	global.impatientMod = ini_read_real("Modifiers", "impatient", false);
	global.excMod = ini_read_real("Modifiers", "excruciating", false);
	global.heavyMod = ini_read_real("Modifiers", "heavy", false);
	global.savageMod = ini_read_real("Modifiers", "savage", false);
	
	global.fullScreen = ini_read_real("Screen", "fullScreen", false);
	global.bopAmount = ini_read_real("Screen", "bopAmount", 3);
	global.resolution = ini_read_real("Screen", "resolution", 2);
	global.freeCamSpeed = ini_read_real("Screen", "freeCamSpeed", 2);
	
	var savedHats = ini_read_string("Misc", "HatsUnlocked", "[0]");

	try
	{
	    global.hatsUnlocked = json_parse(savedHats);
	}
	catch(e)
	{
	    global.hatsUnlocked = [0];
	}
	
	var saveTalked = ini_read_string("Misc", "talkedInvisDialogue", "[0]");

	try
	{
	    global.talkedInvisDialogue = json_parse(saveTalked);
	}
	catch(e)
	{
	    global.talkedInvisDialogue = [0];
	}

    ini_close();
}