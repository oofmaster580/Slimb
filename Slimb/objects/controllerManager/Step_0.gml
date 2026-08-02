global.gamepad = -1;


for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if (gamepad_is_connected(i))
    {
        global.gamepad = i;
      //show_debug_message("Controller connected: " + string(i));
        break;
    }
}

if (gamepad_is_connected(4))
{
    global.gamepad = 4;
}

global.controllerConnected = (global.gamepad != -1);
controllerType = gamepad_get_description(global.gamepad)

show_debug_message(gamepad_get_description(global.gamepad))

if string_count("PS", controllerType) > 0 || string_count("Playstation", controllerType) > 0 || string_count("playstation", controllerType) > 0
{
	show_debug_message("DING")
	global.controllerType = "Playstation"
}
else if string_count("xbox", controllerType) > 0 || string_count("XBOX", controllerType) > 0 || string_count("Xbox", controllerType) > 0
{
	show_debug_message("DING")
	global.controllerType = "Xbox"
}
else if string_count("nintendo", controllerType) > 0 || string_count("Switch", controllerType) > 0 || string_count("switch", controllerType) > 0
{
	show_debug_message("DING")
	global.controllerType = "Nintendo Switch"
}
else
{
	global.controllerType = "PC"
}