void make_rotational_pattern(path unq_path, int num, pair org, pen fill_color=grey, pen border_color=black){
	path[] hands={unq_path};
	for (int hand_num = 0; hand_num < num; ++hand_num) {hands.push(rotate((360/num)*hand_num, org)*unq_path);}
	filldraw(buildcycle(... hands), fill_color, border_color);  
}
