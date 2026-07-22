name = "Slimepedia"

if !global.controllerConnected
{
	dialog = [
		"this thing to my right is a closet",
		"Complete certain things, and unlock different cosmetics!",
		"Interact with it (e) to switch between them.",
		"(PS. Perfect is when you: complete a level without dying, without using checkpoints, while grabbing the plus-one, and beating the level in the certain time frame shown in the top right corner!)"
	];
}
else
{
	dialog = [
		"this thing to my right is a closet",
		"Complete certain things, and unlock different cosmetics!",
		"Interact with it (X for xbox, Square for playstation) to switch between them.",
		"(PS. Perfect is when you: complete a level without dying, without using checkpoints, while grabbing the plus-one, and beating the level in the certain time frame shown in the top right corner!)"
	];
}