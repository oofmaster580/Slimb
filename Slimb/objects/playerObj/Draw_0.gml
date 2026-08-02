draw_self();


if room == TitleRoom && global.isCutscene
{
	draw_set_alpha(0)
}
else
{
	draw_set_alpha(1)
}


var sprIdle = playerSpr;
var sprJump = playerSprJump;
var sprMove = playerSprMovement;
var sprCrouch = playerSprCrouch;
var hatSpr = hats



switch(room)
{
	case Room1:
	case Room1_1:
		sprIdle = playerSpr;
		sprJump = playerSprJump;
		sprMove = playerSprMovement;
		sprCrouch = playerSprCrouch;
		hatSpr = hats;
	break
	
	case Room2:
	case Room2_1:
		sprIdle = playerSpr_1;
		sprJump = playerSprJump_1;
	    sprMove = playerSprMovement_1;
	    sprCrouch = playerSprCrouch_1;
		hatSpr = hats_1
	break
	
	case Room3:
	case Room3_1:
	case jumboRoom:
		sprIdle = playerSpr_2;
		sprJump = playerSprJump_2;
		sprMove = playerSprMovement_2;
		sprCrouch = playerSprCrouch_2;
		hatSpr = hats_2
	break
}


//show_debug_message("Frames: " + string(sprite_get_number(hatSpr)));
//show_debug_message("Selected: " + string(global.hatSelected));

var drawX = round(x);
var drawY = round(y);

if global.hatSelected != 13
{
	if (sprite_index == sprIdle && floor(playerObj.image_index) == 0)
	{
	    draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 3);
	}
	else if (sprite_index == sprIdle && floor(playerObj.image_index) == 1)
	{
	    draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 2);
	}
	else if sprite_index == sprJump
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 5)
	}
	else if sprite_index == sprMove && image_xscale == 1
	{
		draw_sprite(hatSpr, global.hatSelected, drawX + 1, drawY - 2)
	}
	else if sprite_index == sprMove && image_xscale == -1
	{
		draw_sprite(hatSpr, global.hatSelected, drawX - 1, drawY - 2)
	}
	else if sprite_index == sprCrouch
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY + 1)
	}
	else
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 2);
	}
}

if global.hatSelected == 13
{
	if (sprite_index == sprIdle && floor(playerObj.image_index) == 0)
	{
	    draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 1);
	}
	else if (sprite_index == sprIdle && floor(playerObj.image_index) == 1)
	{
	    draw_sprite(hatSpr, global.hatSelected, drawX, drawY);
	}
	else if sprite_index == sprJump
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY - 3)
	}
	else if sprite_index == sprMove && image_xscale == 1
	{
		draw_sprite(hatSpr, global.hatSelected, drawX + 1, drawY)
	}
	else if sprite_index == sprMove && image_xscale == -1
	{
		draw_sprite(hatSpr, global.hatSelected, drawX - 1, drawY)
	}
	else if sprite_index == sprCrouch
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY + 3)
	}
	else
	{
		draw_sprite(hatSpr, global.hatSelected, drawX, drawY);
	}
}