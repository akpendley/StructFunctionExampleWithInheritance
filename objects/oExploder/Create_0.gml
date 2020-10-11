event_inherited();

die = function() {
	instance_create_depth(x, y, 0, oExplosion);
	instance_destroy();
}

set_states();