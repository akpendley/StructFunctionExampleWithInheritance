if (initialized)
{
	draw_set_halign(fa_center);
	draw_self();
	draw_text(x, y + 30, data.name + "\n" + string(hp));
}