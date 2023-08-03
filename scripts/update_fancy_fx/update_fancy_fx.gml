function update_fancy_fx() {
	char_dir += 8 * (pi / 180);
	
	if (char_dir > 2 * pi) {
		char_dir = 0;	
	}
}