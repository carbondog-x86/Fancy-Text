/// @desc Draw it please :3

draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_main);

update_fancy_fx();

draw_set_color(#ffffff);
draw_text(room_width / 2, 16, test_string);

draw_set_color(#ff0000);
draw_fancy_text(room_width / 2, 64, test_string_fancy, true, c_white, c_white, 1);

draw_set_color(#0000ff);
draw_fancy_text(room_width / 2, 128, test_string_fancy, true, c_aqua, c_blue, 1);