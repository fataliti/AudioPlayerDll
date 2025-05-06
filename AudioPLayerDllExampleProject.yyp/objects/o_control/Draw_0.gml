#macro mx mouse_x
#macro my mouse_y

draw_set_halign(fa_center);

var song_path = chan.getSound();
var song_name = string_copy(song_path, string_last_pos("\\", song_path) + 1, string_length(song_path) - string_last_pos("\\", song_path) + 1);
draw_text(room_width / 2, 2, song_name);

draw_set_color(c_gray);
draw_line_width(20, 25, 220, 25, 3);
draw_line_width(20, 65, 120, 65, 3);

draw_set_color(c_white);
draw_text(300, 20, string("{0} / {1}", chan.getPosition(), chan.getDuration()));
draw_text(150, 60, string(chan.getVolume()));

draw_circle(20+200*(chan.getPosition()/chan.getDuration()), 25, 4, false);
draw_circle(20+100*(chan.getVolume()/100), 65, 4, false);


var button = function(_x, _y, _title, _on_click) {
	draw_set_color(c_white);
	draw_rectangle(_x, _y, _x+60, _y+25, false);
	draw_set_color(c_purple);
	draw_text(_x+30, _y+5, _title);
	
	if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, _x, _y, _x+60, _y+25)) {
		_on_click();
	}
}

button(20, 140,  "Set", method(chan, function() /*=>*/ {
	var file = get_open_filename("", "");
	if (file_exists(file)) {
		show_debug_message($"file set '{file}'");
		setSound(file);	
	}
}))
button(90, 140,  "Play", method(chan, chan.play));
button(160, 140, "Pause", method(chan, chan.pause));
button(230, 140, "Stop", method(chan, chan.stop));
button(300, 140,  "Reset", method(chan, chan.reset));

if (mouse_check_button_pressed(mb_left)) {
	if point_in_circle(mx, my, 20+200*(chan.getPosition()/chan.getDuration()), 25, 6) {
		drag = 0;	
	}
	if point_in_circle(mx, my, 20+100*(chan.getVolume()/100), 65, 6) {
		drag = 1;	
	}
}

if drag >= 0 {
	if drag == 0 {
		var pos = clamp((mx - 20) / 200, 0, 1);
		chan.setPosition(chan.getDuration() * pos);
	} else {
		var volume = clamp((mx - 20) / 100, 0, 1);
		chan.setVolume(volume * 100);
	}
	
	if mouse_check_button_released(mb_left) {
		drag = -1;	
	}
}

