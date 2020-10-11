var _enemy = choose("shooter", "exploder");
var _object = global.enemies[? _enemy].type;

var _i = instance_create_depth(mouse_x, mouse_y, 0, _object);
_i.name = _enemy;

show_debug_message("Spawned enemy type " + _enemy);