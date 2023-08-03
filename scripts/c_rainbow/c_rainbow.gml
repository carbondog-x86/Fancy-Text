function c_rainbow(_div) {
	randomize();
	
	return 	make_color_hsv ((current_time / _div) mod 255,255,255);
}