#macro color draw_set_color
#macro mx mouse_x
#macro my mouse_y

draw_text(160,2,chan.getName());

if chan.getName() != "" {
	color(c_gray);
	draw_line_width(20, 25, 220, 25, 3);
	draw_line_width(20, 65, 120, 65, 3);
	
	color(c_white);
	draw_text(250, 20, chan.getPosition());
	draw_text(150, 60, chan.getVolume());

	draw_circle(20+200*(chan.getPosition()/chan.getDuration()), 25, 4, false);
	draw_circle(20+100*(chan.getVolume()/100), 65, 4, false);
}

var button = function(_x, _y, _title, _on_click) {
	color(c_white);
	draw_rectangle(_x, _y, _x+60, _y+25, false);
	color(c_purple);
	draw_text(_x+30, _y+5, _title);
	
	if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, _x, _y, _x+60, _y+25)) {
		_on_click();
	}
}

button(20, 140,  "Set", method(chan, function() /*=>*/ {
	var file = get_open_filename("", "");
	if (file != "") {
		setSound(file);	
	}
}))
button(90, 140,  "Play", method(chan, chan.play))
button(160, 140, "Pause", method(chan, chan.pause))
button(230, 140, "Stop", method(chan, chan.stop))
button(300, 140,  "Reset", method(chan, chan.reset))

// color(c_white);
// draw_rectangle(20, 140, 80, 165, false);
// draw_rectangle(90, 140, 150, 165, false);
// draw_rectangle(160, 140, 220, 165, false);
// draw_rectangle(230, 140, 290, 165, false);

// color(c_purple);
// draw_text(50, 145, "Set");
// draw_text(120, 145, "Play");
// draw_text(190, 145, "Pause");
// draw_text(260, 145, "Stop");
// draw_text(260, 145, "Reset");

if (mouse_check_button_pressed(mb_left)) {
	if point_in_rectangle(mx, my, 20, 140, 80, 165) {
		var file = get_open_filename("", "");
		if (file != "") {
			chan.setSound(file);	
		}
	}
	// if point_in_rectangle(mx, my, 90, 140, 150, 165) {
	// 	chan.play();
	// }
	// if point_in_rectangle(mx, my, 160, 140, 220, 165) {
	// 	chan.pause();
	// }
	// if point_in_rectangle(mx, my, 230, 140, 290, 165) {
	// 	chan.stop();
	// }
	// if point_in_rectangle(mx, my, 230, 140, 290, 165) {
	// 	chan.stop();
	// }
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

