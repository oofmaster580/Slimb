name = "Voice"

if !global.controllerConnected
{
	dialog = [
		"You can interact with the signs by clicking interact (defaulted to E)",
		"I recommend speaking with everything you see, you may find valuable information.",
		"Oh! Before I forget, try interacting with those smiling faces! (After you read all the signs, however)"
	];
}
else if global.controllerConnected && global.controllerType == "Playstation"
{
	dialog = [
		"You can interact with the signs by clicking interact (defaulted to Square)",
		"I recommend speaking with everything you see, you may find valuable information.",
		"Oh! Before I forget, try interacting with those smiling faces! (After you read all the signs, however)"
	];
}
else if global.controllerConnected && global.controllerType == "Xbox"
{
	dialog = [
		"You can interact with the signs by clicking interact (defaulted to X)",
		"I recommend speaking with everything you see, you may find valuable information.",
		"Oh! Before I forget, try interacting with those smiling faces! (After you read all the signs, however)"
	];
}
else if global.controllerConnected && global.controllerType == "Nintendo Switch"
{
	dialog = [
		"You can interact with the signs by clicking interact (defaulted to Y)",
		"I recommend speaking with everything you see, you may find valuable information.",
		"Oh! Before I forget, try interacting with those smiling faces! (After you read all the signs, however)"
	];
}

ID = 2