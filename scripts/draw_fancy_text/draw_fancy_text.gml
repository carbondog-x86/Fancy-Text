function draw_fancy_text(_x, _y, _str, _center, _col_1, _col_2, _alpha) {
	var _prev_halign = draw_get_halign();
	var _prev_valign = draw_get_valign();
	var _prev_color = draw_get_color();
	var _length = string_length(_str);
	var _newline_count = string_count("#", _str);
	var _wave_count = string_count("[", _str);
	var _offset_x, _offset_y;
	
	static _line = array_create(string_count("#", _str));
	static _line_index = 0;
	static _wave = false;
	static _shake = false;
	static _rainbow = false;
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);	
	
	// Scan through the string and find any line breaks
	for (var c = 0; c < _length; c++) {
		var _char_at = string_char_at(_str, c + 1);		
		
		if (_char_at == "#") {
			if (_line_index < _newline_count) {
				_line_index++;
			}
			_line[_line_index] = c + 1;
		}		
	}	
	
	// Output the final string
	for (var l = 0; l < _newline_count; l++) {
		if (_line_index < l) {
			_line[l] = _length;
		}
		
		for (var s = _line[l]; s < _line[l + 1]; s++) {
			var _char = string_char_at(_str, s + 1);
			var _char_size = string_width(_char);
			
			if (_center == true) {
				_offset_x = (_line[l + 1] * (_char_size / 2)) + (_line[l] * (_char_size / 2));
				_offset_y = ((_char_size / 2) * _line_index);				
			} else {
				_offset_x = (_line[l] * _char_size) + 8;
				_offset_y = 0;
			}						
			
			var _xx = _x + (_char_size * s) - _offset_x;
			var _yy = _y + (_char_size * l) - _offset_y;
			
			var _wave_x = cos(char_dir + s);
			var _wave_y = sin(char_dir + s);
			var _shake_x = random_range(-2, 2) / 3;
			var _shake_y = random_range(-3, 3) / 3;
			
			if (_char == "[") {
				_wave = true;
			}
			
			if (_char == "]") {
				_wave = false;
			}
			
			if (_char == "{") {
				_shake = true;	
			}
			
			if (_char == "}") {
				_shake = false;	
			}
			
			if (_char == "<") {
				_rainbow = true;	
			}
			
			if (_char == ">") {
				_rainbow = false;	
			}
			
			var _rainbow_col = c_rainbow(10);
			
			if (_rainbow && !_shake && !_wave && _char != "#" && _char != "[" && _char != "]" && _char != "{" && _char != "}" && _char != "<" && _char != ">") {
				draw_text_color(_xx + _wave_x, _yy + _wave_y, _char, _rainbow_col, _rainbow_col, _rainbow_col, _rainbow_col, _alpha);	
			}
			
			if (!_rainbow && _shake && !_wave && _char != "#" && _char != "[" && _char != "]" && _char != "{" && _char != "}" && _char != "<" && _char != ">") {
				draw_text_color(_xx + _shake_x, _yy + _shake_y, _char, _col_1, _col_1, _col_2, _col_2, _alpha);	
			}	
			
			if (!_rainbow && !_shake && _wave && _char != "#" && _char != "[" && _char != "]" && _char != "{" && _char != "}" && _char != "<" && _char != ">") {
				draw_text_color(_xx + _wave_x, _yy + _wave_y, _char, _col_1, _col_1, _col_2, _col_2, _alpha);	
			}			
			
			if (!_rainbow && !_shake && !_wave && _char != "#" && _char != "[" && _char != "]" && _char != "{" && _char != "}" && _char != "<" && _char != ">") {
				draw_text_color(_xx, _yy, _char, _col_1, _col_1, _col_2, _col_2, _alpha);	
			}
		}
	}
	
	// After drawing text
	draw_set_valign(_prev_valign);
	draw_set_halign(_prev_halign);
}