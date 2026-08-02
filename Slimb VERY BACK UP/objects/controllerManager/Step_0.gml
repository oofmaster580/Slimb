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