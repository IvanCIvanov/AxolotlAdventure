#region Player Movement

// Get input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

// Input vectors (-1 = left/up, 1 = right/down)
var move_x = key_right - key_left;
var move_y = key_down - key_up;

// Normalize movement so diagonal is not faster
var move_len = point_distance(0, 0, move_x, move_y);
if (move_len != 0) {
    move_x /= move_len;
    move_y /= move_len;
}

// Horizontal movement (smoother motion using lerp)
if (move_x != 0) {
	hsp = lerp(hsp, move_x * move_speed, accel);
}
else {
	hsp = lerp(hsp, 0, accel);
}

// Vertical movement
if (move_y != 0) {
	vsp = lerp(vsp, move_y * move_speed, accel);
}
else {
	vsp = lerp(vsp, 0, accel);
}

#endregion

#region Colliding with Walls

// Horizontal collision
if (place_meeting(x + hsp, y, obj_wall))
{			
	while (!place_meeting(x + sign(hsp), y, obj_wall))
	{
		x += sign(hsp);
	}
	
	hsp = 0;
}

// Vertical collision
if (place_meeting(x, y + vsp, obj_wall))
{			
	while (!place_meeting(x, y + sign(vsp), obj_wall))
	{
		y += sign(vsp);
	}
	
	vsp = 0;
}

#endregion

// Apply movement
x += hsp;
y += vsp;