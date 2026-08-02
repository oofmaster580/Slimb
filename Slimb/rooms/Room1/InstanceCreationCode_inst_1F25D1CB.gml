name = "Justin Case"

if !global.controllerConnected
{
	dialog = [
		"This is a checkpoint",
		"It stores your location for when you die, but everything comes at a price!",
		"Activating this will take five of your lives",
		"Click E to activate.",
		"(PS. the smile kind of scares me, i would be wary if I were you.)"
	];
}
else if global.controllerConnected && global.controllerType == "Playstation"
{
	dialog = [
		"This is a checkpoint",
		"It stores your location for when you die, but everything comes at a price!",
		"Activating this will take five of your lives.",
		"Click Square to activate.",
		"(PS. the smile kind of scares me, i would be wary if I were you.)"
	];
}
else if global.controllerConnected && global.controllerType == "Playstation"
{
	dialog = [
		"This is a checkpoint",
		"It stores your location for when you die, but everything comes at a price!",
		"Activating this will take five of your lives.",
		"Click Square to activate.",
		"(PS. the smile kind of scares me, i would be wary if I were you.)"
	];
}