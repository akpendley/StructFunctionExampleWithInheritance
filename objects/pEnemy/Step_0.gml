if (initialized)
{
	if (!is_alive()) state = ENEMYSTATE.DIE;
	
	if (is_method(states[state]))
	{
		states[state]();
	}
}