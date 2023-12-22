size(200);
pair O = (0.0, 0.0), low_left_pnt, uc_centre;
real a = 10.0, sep = 15.0;
real eq_rad = a/6;
path utc = box(O + (0.0, -a), O + (a, 0.0));
real[] angles = {0.0, pi*0.25, pi*0.45, pi*0.7, 0.9*pi};
real[] asp_ratios = {5.0, 3.0, 1.25};
//
path ellipse_path(
	pair C = (0.0, 0.0),
  	real eqrad = 1.0,
  	real asp_ratio = 2.0,
  	real theta = pi * 0.0
){
    return rotate(degrees(theta), C)*ellipse(C, eqrad * sqrt(asp_ratio), eqrad / sqrt(asp_ratio));
}
//
for (int i=0; i< angles.length; ++i){
  	real ang = pi;
  	for (int j=0; j<asp_ratios.length; ++j){
      	low_left_pnt = (sep*i, sep*j);
      	uc_centre = low_left_pnt + (a/2, -a/2);
    	filldraw(shift(low_left_pnt)*utc, lightgrey);
      	filldraw(ellipse_path(uc_centre, eq_rad, asp_ratios[j], angles[i]));
    }
}
