owner = noone;
move_speed = 8;
move_direction = 0;
hit_list = ds_list_create();
death_timer = 0;
death_timer_max = 5;
damage = 0;

move = function() {
	if (death_timer == 0)
	{
		x += lengthdir_x(move_speed, move_direction);
		y += lengthdir_y(move_speed, move_direction);
	}
}

check_collision = function() {
	if (death_timer > 0)
	{
		death_timer--;
		if (death_timer == 0) instance_destroy();
	}
	else
	{
		if (x > room_width || x < 0 || y < 0 || y > room_height)
		{
			instance_destroy();
		}
	
		var _inst = collision_point(x, y, pEntity, true, true)
		
		if (_inst != noone && _inst != undefined && _inst != owner)
		{
			death_timer = death_timer_max;
			sprite_index = sLaserImpact;
			var _found = false;
			for (var i = 0; i < ds_list_size(hit_list); i++)
			{
				if (hit_list[| i] == _inst)
				{
					_found = true;
					break;
				}
			}

			if (!_found)
			{
				ds_list_add(hit_list, _inst);
				_inst.hurt(damage);
			}
		}
	}
}