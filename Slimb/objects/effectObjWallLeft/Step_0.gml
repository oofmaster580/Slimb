if global.cameraLook || instance_exists(dialogBoxObj) return;

x += moveX;
y += moveY;

fadeTimer--;

if (fadeTimer > 0) return;

fadeTimer = 3;

if (image_alpha > 0)
{
	image_alpha -= 0.1;
}
else
{
	instance_destroy();
}