initialized = false;
state = ENEMYSTATE.FREE;

data = 
{
	type : pEnemy,
	name : "shooter",
	hp : 10,
	damage : 1,
	mass : 30
}

hp_max = data.hp;
hp = hp_max;

attacks = [];

combat = 
{
	attack : {},
	cooldown : 0,
	timer : 0,
	comboable : false,
	combo : 0,
	max_combo : 0
}

movement = 
{
	move_direction : 0,
	move_speed : 3,
	move_acceleration : data.mass * ACCELERATION_MODIFIER,
	turn_rate : data.mass * MASS_MODIFIER
}

is_alive = function() {
	if (hp > 0) return true;
	return false;
}

move = function(_direction, _speed) {
	// movement code
}

free = function() {
	// decision between wait and wander
	// aggro decisions
}

wander = function() {
	// choose a random direction
}

attack = function() {
	// attack code
}

hurt = function(_damage) {
	hp -= _damage;
}

die = function() {
	instance_destroy();
}

initialize = function() {
	data.name = name;
	if (global.enemies[? data.name] != undefined)
	{
		data = global.enemies[? data.name];
		sprite_index = data.sprite;
		// structs are passed by reference, so if we mess with data.hp, it will impact the data.hp in global.enemies, so copy it out
		hp_max = data.hp;
		hp = hp_max;
	}
	else
	{
		show_debug_message("Enemy type not found in database.");
	}
	initialized = true;
}

set_states = function() {
	// if we override one of these state functions in a child, we need to call set_states() in the child
	// otherwise we will still have states[state] set to the old method variable declared in this, the parent.
	states[ENEMYSTATE.FREE] = free;
	states[ENEMYSTATE.WANDER] = wander;
	states[ENEMYSTATE.ATTACK] = attack;
	states[ENEMYSTATE.HURT] = hurt;
	states[ENEMYSTATE.DIE] = die;
}

set_states();

alarm[0] = 1;