pair get_point(pair c, real r, real theta){return c + (r*cos(theta), r*sin(theta));}

// =================================================
//                  Rounded Box
// =================================================
path rounded_box(pair z1, pair z2, real r){
    pair zc = 0.5 * (z1 + z2);
    path a1 = arc((z2.x - r, z2.y - r), (z2.x, z2.y - r), (z2.x-r, z2.y));
    path a2 = arc((z1.x + r, z2.y - r), (z1.x + r, z2.y), (z1.x, z2.y - r));
    path a3 = arc((z1.x + r, z1.y + r), (z1.x, z1.y + r), (z1.x + r, z1.y));
    path a4 = arc((z2.x - r, z1.y + r), (z2.x - r, z1.y), (z2.x, z1.y + r));
    return a1 -- a2 -- a3 -- a4 -- cycle;
}


// =================================================
//                  Ellipse
// =================================================
path ellipse_path(
	pair C = (0.0, 0.0),
  	real eqrad = 1.0,
  	real asp_ratio = 2.0,
  	real theta = pi * 0.0
){
    return rotate(degrees(theta), C)*ellipse(C, eqrad * sqrt(asp_ratio), eqrad / sqrt(asp_ratio));
}

// =================================================
//                  n-Regular Polygon
// =================================================
path n_regular_polygon(
    int n,  // num_sides
    real a=10.0,  // side_len
  	pair cent=(0.0, 0.0),  // centre of polygon
    real theta = 0.25,  // angle of the first tip w.r.t x-axis
    real rc=2.0  // corner_radius
){
    real alpha = pi/n;
    real max_rc = a * cos(alpha) / (2.0 * sin(alpha));  // inscribed circle radius
    real h = (a/(2.0*sin(alpha))) - (rc/cos(alpha));
    pair C1 = get_point(cent, h, theta);  // centre of first tip fillet 
    pair P1 = get_point(C1, rc, theta);
    pair P2 = get_point(C1, rc, theta + alpha);
    pair C2 = get_point(cent, h, theta + 2.0*alpha);  // centre of second tip fillet 
    pair P3 = get_point(C2, rc, theta + alpha);
    pair P4 = get_point(C2, rc, theta + 2.0 * alpha);
    path first_side = arc(C1, P1, P2, CCW) -- arc(C2, P3, P4, CCW);
  	path n_reg_poly = first_side;
    for (int i=1; i < n; ++i){n_reg_poly = n_reg_poly -- rotate((360/n)*i, cent)*first_side;    }
    return n_reg_poly -- cycle;
}
path n_regular_polygon(
    int n,  // num_sides
    real eqrad,  // equivalent radius
    real crr,  // corner_radius_ratio
  	pair cent=(0.0, 0.0),  // centre of polygon
    real theta = 0.25  // angle of the first tip w.r.t x-axis
){
    real alpha = pi/n;
    real k = crr * crr * (1.0 - (alpha/tan(alpha)));
    real side_len = eqrad * sqrt((4.0*alpha*tan(alpha))/(1.0-k));
    real corner_radius = (side_len * crr) / (2.0 * tan(alpha));
    return n_regular_polygon(n, side_len, cent, theta, corner_radius);
}


// =================================================
//                  Rounded rectangle
// =================================================
//
// With known semi-major axis, semi-minor axis and corner-radius values
path rounded_rectangle(
    real a=2.0, real b=1.0,
	pair cent = (0.0, 0.0),
    real rc=0.1,
    real theta = pi*0.25
){
    path q1 = ((a, 0.0) -- arc((a-rc, b-rc), (a, b-rc), (a-rc, b)) -- (0, b));
  	path q2 = reflect((0.0, 0.0), (0.0, b)) * q1;  	
  	path q3 = reflect((0.0, 0.0), (a, 0.0)) * q2;  
  	path q4 = reflect((0.0, 0.0), (a, 0.0)) * q1;  
  	path rect_path = q1--reverse(q2)--q3--reverse(q4)--cycle;
  	return shift(cent)*rotate(degrees(theta))*rect_path;
}

path rounded_rectangle(
    real eqrad, real asp_ratio, real crr,
    pair cent=(0.0, 0.0),
    real theta = 0.0
){
    real k = 4.0/pi;
    real smnx = eqrad / (sqrt((k*asp_ratio) - (crr * crr * (k-1.0))));
    return rounded_rectangle(asp_ratio*smnx, smnx, cent, smnx * crr, theta);
}


path c_shape(
	real ri, real ro, real incl_angle,
  	pair cent = (0.0, 0.0),
  	real theta = pi * 0.0
){
  	real rm = 0.5 * (ri + ro), t = 0.5 * (ro - ri);
	pair c1 = get_point(cent, rm, 0.0);
  	pair c2 = get_point(cent, rm, incl_angle);
  	return rotate(degrees(theta), cent)*(
    	arc(c1, t, -180, 0.0, CCW) 
      --arc(cent, ro, 0.0, degrees(incl_angle), CCW)
      --arc(c2, t, degrees(incl_angle), degrees(incl_angle) + 180.0, CCW)
      --arc(cent, ri, degrees(incl_angle), 0.0, CW)
      --cycle
    );
}

draw(c_shape(1.0, 3.0, 90));


size(200.0);
filldraw(rounded_rectangle(3, 1), red);


size(200.0);
filldraw(n_regular_polygon(5, 3.0, 0.1), grey, black);