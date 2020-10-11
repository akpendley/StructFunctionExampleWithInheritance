global.enemies = ds_map_create();
global.enemies[? "shooter"] = 
{ 
	type : pEnemy,
	name : "shooter",
	sprite : sShooter,
	hp : 10,
	damage : 1,
	mass : 30
}
global.enemies[? "exploder"] = 
{ 
	type : oExploder,
	name : "exploder",
	sprite : sExploder,
	hp : 20,
	damage : 2,
	mass : 60
}

room_goto_next();