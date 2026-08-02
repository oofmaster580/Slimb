name = "Slimepedia"

if global.deaths <= 10
{
	dialog = [
		"You have died a total of: " + string(global.deaths) + " times!",
		"Looking good!"
	];
}
else if global.deaths <= 25
{
	dialog = [
		"You have died a total of: " + string(global.deaths) + " times!",
		"Have you tried..",
		"not dying..?"
	];
}
else if global.deaths <= 50
{
	dialog = [
		"You have died a total of: " + string(global.deaths) + " times!",
		"This is getting out of control man, you would think after 25 you would be good to go.."
	];
}
else
{
	dialog = [
		"You have died a total of: " + string(global.deaths) + " times!",
		"You dissapoint me."
	];
}