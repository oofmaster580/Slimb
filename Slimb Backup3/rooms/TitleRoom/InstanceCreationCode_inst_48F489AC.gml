name = "Bill Board"

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
else
{
	dialog = [
		"Hello there!",
		"Welcome to my tower.",
		"Joystick or DPAD to move (obviously)",
		"A to Jump if xbox, X for playstation.",
		"Shouldn't be too complicated, try not to screw this up somehow.",
		"This is in early testing. if you encounter any bugs, message me!",
		"If you get stuck, click r to reset to your last checkpoint."
	];
}