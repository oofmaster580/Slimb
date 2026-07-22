name = "Paige Turner"

if !global.controllerConnected
{
	dialog = [
		"Y'see those blocks to yur left that have those lines in em?",
		"Well you can dash though em' by pressing I and runnin' into em'!",
		"Now aint dat neat?",
		"(FYI, you can dash in any direction! Try holding W and dashing.)"
	];
}
else
{
	dialog = [
		"Y'see those blocks to yur left that have those lines in em?",
		"Well you can dash though em' by pressing right trigger and runnin' into em'!",
		"Now aint dat neat?",
		"(FYI, you can dash in any direction! Try holding W and dashing.)"
	];
}