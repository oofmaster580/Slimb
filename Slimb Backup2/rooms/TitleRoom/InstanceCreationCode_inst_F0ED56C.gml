name = "Voice"

if !global.controllerConnected
{
	dialog = [
		"Hello there!",
		"Welcome to my tower.",
		"WASD to move (obviously)",
		"J to Jump.",
		"Shouldn't be too complicated, try not to screw this up somehow.",
		"This is in early testing. if you encounter any bugs, message me!",
		"If you get stuck, click r to reset to your last checkpoint."
	];
}
else if global.controllerConnected && global.controllerType == "Playstation"
{
	dialog = [
		"Hello there!",
		"Welcome to my tower.",
		"Joystick or DPAD to move (obviously)",
		"X to Jump.",
		"Shouldn't be too complicated, try not to screw this up somehow.",
		"This is in early testing. if you encounter any bugs, message me!",
		"If you get stuck, click triangle to reset to your last checkpoint."
	];
}
else if global.controllerConnected && global.controllerType == "Xbox"
{
	dialog = [
		"Hello there!",
		"Welcome to my tower.",
		"Joystick or DPAD to move (obviously)",
		"A to Jump.",
		"Shouldn't be too complicated, try not to screw this up somehow.",
		"This is in early testing. if you encounter any bugs, message me!",
		"If you get stuck, click Y to reset to your last checkpoint."
	];
}
else if global.controllerConnected && global.controllerType == "Nintendo Switch"
{
	dialog = [
		"Hello there!",
		"Welcome to my tower.",
		"Joystick or DPAD to move (obviously)",
		"B to Jump.",
		"Shouldn't be too complicated, try not to screw this up somehow.",
		"This is in early testing. if you encounter any bugs, message me!",
		"If you get stuck, click X to reset to your last checkpoint."
	];
}

ID = 1