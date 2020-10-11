
state = PLAYERSTATE.FREE;
fire_offset = 32;
fire_cooldown = 0;
fire_cooldown_max = 3;
damage = 1;

inputs = 
{
	thrust : 0,
	turn : 0,
	fire : 0
}

movement = 
{
	move_speed : 3,
	move_direction : 0
}

get_inputs = function() {
	
	var forward = keyboard_check(ord("W"));
	var backward = keyboard_check(ord("S"));
	var clockwise = keyboard_check(ord("D"));
	var counter_clockwise = keyboard_check(ord("A"));
	
	inputs.thrust = forward - backward;
	inputs.turn = counter_clockwise - clockwise; // keep in mind clockwise is a negative rotation
	inputs.fire = mouse_check_button(mb_left);
}

move = function() {
	if (inputs.turn != 0)
	{
		movement.move_direction += inputs.turn;
	}
	
	image_angle = movement.move_direction;
	
	var _len = inputs.thrust;
	var _dir = movement.move_direction;
	
	x += lengthdir_x(_len, _dir);
	y += lengthdir_y(_len, _dir);
}

fire = function() {
	var _i = instance_create_depth(x + lengthdir_x(fire_offset, movement.move_direction), y + lengthdir_y(fire_offset, movement.move_direction), 0, oLaser);
	_i.owner = id;
	_i.move_direction = movement.move_direction;
	_i.image_angle = movement.move_direction;
	_i.damage = damage;
	fire_cooldown = fire_cooldown_max;
}

free = function() {
	move();
	if (inputs.fire && !fire_cooldown--) fire();
}

hurt = function() {

}

states[PLAYERSTATE.FREE] = free;