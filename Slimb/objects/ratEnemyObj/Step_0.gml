if global.cameraLook return;
if instance_exists(obj_pause_menu) || instance_exists(dialogBoxObj) return;

var dt = delta_time / 100000
image_speed = xspeed / 10

grounded =  (place_meeting(x, y + yspeed * dt, hitboxColObj) ||
			place_meeting(x, y + yspeed * dt, hitboxColObjWall))
			
xspeed = clamp(xspeed, -16, 16)

if (point_distance(x, y, playerObj.x, playerObj.y) < 150)
{
    if (playerObj.x < x)
    {
        image_xscale = -1;
        xspeed -= movementSpeed
    }
    else if (playerObj.x > x)
    {
        image_xscale = 1;
        xspeed += movementSpeed
    }
	
	
	
	
}
else
{
	xspeed = lerp(xspeed, 0, 0.1)
}


if (place_meeting(x + xspeed * dt, y, hitboxColObj) ||
	place_meeting(x + xspeed * dt, y, hitboxColObjWall))
{
    xspeed = -xspeed / 2;
}
else
{
    x += xspeed * dt;
}

if grounded
{
    yspeed = 0;
	
	if (random_range(0, 30) >= 28) && (point_distance(x, y, playerObj.x, playerObj.y) < 150)
	{
	    yspeed = -round(random_range(4, 6));
	}
	
	if (playerObj.jumpPressed) && (point_distance(x, y, playerObj.x, playerObj.y) < 150)
	{
	    yspeed -= 10;
	}
}
else
{
    y += yspeed * dt;
}

yspeed += fallSpeed * dt;