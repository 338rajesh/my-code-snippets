size(350,350);
real ox=0.0;
real oy=0.0;
import geometry;
pen blackDashedPen = black+linewidth(0.1);
pen blackPen = blue+linewidth(0.7);
real font_scale = 0.65;
real grid_w = 13.0;
real grid_h = 14.0;
real col1_x = ox + 2*grid_w;
real col2_x = ox + 3*grid_w;
real col3_x = ox + 4.6*grid_w;
real col4_x = ox + 5.6*grid_w;
real row1_y = oy - 2*grid_h;
real row2_y = oy - 3*grid_h;
real row3_y = oy - 4*grid_h;
real row4_y = oy - 5*grid_h;
real row5_y = oy - 6*grid_h;
// ===========================================
// 					 Ellipse 
// ===========================================
pair elps_center = (col1_x-grid_w*0.5, row1_y);
real elps_a = 6.0;
real elps_b = 3.0;
path elps = rotate(45.0, elps_center)*ellipse(elps_center, elps_a, elps_b);
pair elps_p1 = elps_center + (elps_a*cos(pi*0.25), elps_a*sin(pi*0.25));
pair elps_p2 = elps_center + (elps_b*cos(pi*0.75), elps_b*sin(pi*0.75));
filldraw(elps , gray(0.75), blackPen);
dot(" ", elps_center, S);
draw(elps_center--elps_p1, Arrow(5.0));
draw(elps_center--elps_p2, Arrow(5.0));
label(scale(font_scale)*"$a$", elps_p1-(1.5, 1.0), SE);
label(scale(font_scale)*"$b$", elps_p2-(-1.0, 0.5), SW);
// 
// Formulae
label(scale(font_scale)*"\textbf{Ellipse}", (col2_x, row1_y+0.4*grid_h));
label(scale(font_scale)*"$\delta = {a}/{b} \in [1, \infty)$", (col2_x, row1_y+0.2*grid_h));
label(scale(font_scale)*"$\mathbf{P} \approx \pi b [3(\delta+1) - \sqrt{(3\delta + 1)(\delta + 3)}]$", (col2_x, row1_y+0.0*grid_h));
label(scale(font_scale)*"$\mathbf{A}$=$\pi b^2 \delta$", (col2_x, row1_y-0.2*grid_h));
label(graphic("RVEellld.png","height=2cm"),(col3_x, row1_y+0.1*grid_h));
label(scale(font_scale)*"$\delta_{min}$=1.0, $\beta$=1.0", (col3_x, row1_y-0.37*grid_h));
label(graphic("RVEellud.png","height=2cm"),(col4_x, row1_y+0.1*grid_h));
label(scale(font_scale)*"$\delta_{max}$=4.0, $\beta$=1.365", (col4_x, row1_y-0.37*grid_h));
//
// ===========================================
// 				Regular Polygon 
// ===========================================
pair Crp = (col1_x-grid_w*0.5, row2_y);
int n = 3;
real side_length = 12.5;
real c_rad = 0.85;
real theta = 0.0*pi;
real alpha = pi/n;
real beta = (n-2.0)*alpha;
real in_rad = (side_length*cos(alpha))/(2.0*sin(alpha));
real h = (side_length/(2.0*sin(alpha))) - (c_rad/cos(alpha));
pair C1 = (Crp.x + h*cos(theta), Crp.y + h*sin(theta));
pair C2 = (Crp.x + h*cos(theta+(2.0*alpha)), Crp.y + h*sin(theta+(2.0*alpha)));
pair P1 = (C1.x + c_rad*cos(theta-alpha), C1.y + c_rad*sin(theta-alpha));
pair P2 = (C1.x + c_rad*cos(theta+alpha), C1.y + c_rad*sin(theta+alpha));
pair P3 = (C2.x + c_rad*cos(theta+alpha), C2.y + c_rad*sin(theta+alpha));
path first_path = arc(C1, P1, P2, CCW)--P3;
path full_first_path = Crp--arc(C1, P1, P2, CCW)--P3--cycle;
path reg_polygon = rotate(-90, Crp)*shift(Crp)*scale(side_length/(2.0*sin(alpha)))*polygon(n);
draw(reg_polygon, grey+linewidth(0.25));
fill(full_first_path, gray(0.75));
for (int side_num = 1; side_num < n; ++side_num) {
  fill(rotate((360/n)*side_num, Crp)*full_first_path, gray(0.75));
  draw(rotate((360/n)*side_num, Crp)*first_path, blackPen);  
}
draw(first_path, blackPen);
// LABELS
dot(" ", Crp, S);
draw(scale(font_scale)*"$r_c$", C1--(C1.x+(c_rad*cos(theta)), C1.y+(c_rad*sin(theta))), W, Arrow(50.9));
// pair a_in_rad_pt = Crp + (in_rad*cos(theta+(3.0*alpha)), in_rad*sin(theta+(3.0*alpha)));
path a_rp_side = shift(0.5, 0.5)*subpath(reg_polygon, 1, 2);
draw(a_rp_side, Arrows(5.0));
label(scale(font_scale)*"a", midpoint(a_rp_side), N);
//
// Formulae
label(scale(font_scale)*"\textbf{n-sided Regular Polygon}", (col2_x, row2_y+0.4*grid_h));
label(scale(font_scale)*"$\delta$ = ${(2 r_c \tan{\alpha})}/{a} \in [0, 1]$; $\alpha=\pi/n$", (col2_x, row2_y+0.2*grid_h));
label(scale(font_scale)*"$\mathbf{P} = n a (1 - \delta(1-\alpha\cot\alpha))$", (col2_x, row2_y+0.0*grid_h));
label(scale(font_scale)*"$\mathbf{A}$=$\frac{1}{4}n a^2 \cot\alpha\left( 1 - \delta^2 (1 - \alpha\cot\alpha) \right)$", (col2_x, row2_y-0.2*grid_h));

label(graphic("RVEtrild.png","height=2cm"),(col3_x, row2_y+0.1*grid_h));
label(graphic("RVEtriud.png","height=2cm"),(col4_x, row2_y+0.1*grid_h));
label(scale(font_scale)*"$n$=3;", (col3_x-0.65*grid_w, row2_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{min}$=0.1, $\beta$=1.238", (col3_x, row2_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{max}$=1.0, $\beta$=1.0", (col4_x, row2_y-0.37*grid_h));
//
// ===========================================
// 				 Round Rectangle 
// ===========================================
pair C = (col1_x-grid_w*0.5, row3_y);
real a = 6.0;
real b = 3.0;
real rc = 0.6;
real tht = 0.25 * pi;
real cth = cos(tht);
real sth = sin(tht);
pair C1   = (C.x + (a-rc) * cth - (b-rc) * sth, C.y + (a-rc) * sth + (b-rc) * cth);
pair C1p1 = (C.x + a * cth - (b-rc) * sth, C.y + a * sth + (b-rc) * cth);
pair C1p2 = (C.x + (a-rc) * cth - b * sth, C.y + (a-rc) * sth + b * cth);
pair C2   = (C.x - (a-rc) * cth - (b-rc) * sth, C.y - (a-rc) * sth + (b-rc) * cth);
pair C2p1 = (C.x - (a-rc) * cth - b * sth, C.y - (a-rc) * sth + b * cth);
pair C2p2 = (C.x - a * cth - (b-rc) * sth, C.y - a * sth + (b-rc) * cth);
pair C3 = (C.x - (a-rc) * cth + (b-rc) * sth, C.y - (a-rc) * sth - (b-rc) * cth);
pair C3p1 = (C.x - a * cth + (b-rc) * sth, C.y - a * sth - (b-rc) * cth);
pair C3p2 = (C.x - (a-rc) * cth + b * sth, C.y - (a-rc) * sth - b * cth);
pair C4 = (C.x + (a-rc) * cth + (b-rc) * sth, C.y + (a-rc) * sth - (b-rc) * cth);
pair C4p1 = (C.x + (a-rc) * cth + b * sth, C.y + (a-rc) * sth - b * cth);
pair C4p2 = (C.x + a * cth + (b-rc) * sth, C.y + a * sth - (b-rc) * cth);
path rounded_rect = (arc(C1, C1p1, C1p2)--arc(C2, C2p1, C2p2)--arc(C3, C3p1, C3p2)--arc(C4, C4p1, C4p2)--cycle);
filldraw(rounded_rect, gray(0.75), blackPen);
// LABELS
dot(" ", C, S);
pair rect_p1 = C + (a*cos(tht), a*sin(tht));
pair rect_p2 = C + (b*cos((0.5*pi) + tht), b*sin((0.5*pi)+tht));
draw(C--rect_p1, Arrow(5.0));
draw(C--rect_p2, Arrow(5.0));
pair rc_pnt = (C2.x+(rc*cos(tht+0.75*pi)), C2.y+(rc*sin(tht+0.75*pi)));
draw( scale(font_scale)*"$r_c$", C2--rc_pnt, W, Arrow(10.0));
label(scale(font_scale)*"$a$", rect_p1-(1.5, 1.0), SE);
label(scale(font_scale)*"$b$", rect_p2-(-1.0, 0.5), SW);
//
// Formulae
label(scale(font_scale)*"\textbf{Rectangle}", (col2_x, row3_y+0.4*grid_h));
label(scale(font_scale)*"$\delta$ = ${a}/{b} \in [1, \infty)$; $\delta_c$ = ${r_c}/{b} \in [0, 1]$", (col2_x, row3_y+0.2*grid_h));
label(scale(font_scale)*"$\mathbf{P} $ = $b[4(\delta+1) - (4 - \pi)\delta_c]$", (col2_x, row3_y+0.0*grid_h));
label(scale(font_scale)*"$\mathbf{A} $=$b^2 [4 \delta - (4 - \pi)\delta_c^2]$", (col2_x, row3_y-0.2*grid_h));
//
// RVE Images
label(graphic("RVErectld.png","height=2cm"),(col3_x, row3_y+0.1*grid_h));
label(graphic("RVErectud.png","height=2cm"),(col4_x, row3_y+0.1*grid_h));
label(scale(font_scale)*"$\delta_c$=0.25;", (col3_x-0.65*grid_w, row3_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{min}$=1, $\beta$=1.075", (col3_x, row3_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{max}$=4, $\beta$=1.383", (col4_x, row3_y-0.37*grid_h));
//
// ===========================================
// 				 	C-Shape
// ===========================================
pair C = (col1_x-grid_w*0.5, row4_y);
real alpha1 = pi * 0.25;
real alpha2 = pi * 1.55;
real alpham = 0.5*(alpha1+alpha2);
real ri = 2.5;
real ro = 5.0;
real rm = 0.5 * (ri+ro);
//
//
pair P1 = (C.x + ri*cos(alpha1), C.y + ri*sin(alpha1));
pair C1 = (C.x + rm*cos(alpha1), C.y + rm*sin(alpha1));
pair Q1 = (C.x + ro*cos(alpha1), C.y + ro*sin(alpha1));
pair P2 = (C.x + ri*cos(alpha2), C.y + ri*sin(alpha2));
pair C2 = (C.x + rm*cos(alpha2), C.y + rm*sin(alpha2));
pair Q2 = (C.x + ro*cos(alpha2), C.y + ro*sin(alpha2));
//
path CSHpath = (arc(C,P2, P1, CW)--arc(C1, P1, Q1, CCW)--arc(C, Q1, Q2, CCW)--arc(C2, Q2, P2, CCW)--cycle);
pen solidPen=red+linewidth(0.5);
filldraw(CSHpath, gray(0.75), blackPen);
//
// LABELS
dot(scale(0.8)*" ", C, E);
dot(scale(0.4)*" ", C1, NW);
dot(scale(0.4)*" ", C2, W);
markangle(Label(scale(font_scale)*" ", Relative(0.5)), n=1, radius=-4, C2, C, C1); // ANGLE LABEL
label(scale(font_scale)*"$\alpha$", C, SW);
pair csh_p1 = (C.x+(ri*cos(alpha1*2.8)), C.y + (ri*sin(alpha1*2.8)));
pair csh_p2 = (C.x+(ro*cos(alpha2*0.6)), C.y + (ro*sin(alpha2*0.6)));
draw(C--csh_p1, Arrow(5.0));
draw(C--csh_p2, Arrow(5.0));
draw(C1--C--C2, dashed);
label(scale(font_scale)*"$R_i$", csh_p1, N);
label(scale(font_scale)*"$R_o$", csh_p2, W);
//
// Formulae
label(scale(font_scale)*"\textbf{C-shape}", (col2_x, row4_y+0.4*grid_h));
label(scale(font_scale)*"$\delta = ({R_o}/{R_i}) - 1 \in [0, \infty)$", (col2_x, row4_y+0.2*grid_h));
label(scale(font_scale)*"$\mathbf{P}$=$2\pi r+  2\alpha r_m$ \;; $\mathbf{A}$=$\pi r^2 + 2\alpha r r_m$", (col2_x, row4_y+0.0*grid_h));
label(scale(font_scale)*"$2r={R_o-R_i} \;; 2r_m = {R_o+R_i}$", (col2_x, row4_y-0.2*grid_h));
label(graphic("RVEcshld.png","height=2cm"),(col3_x, row4_y+0.1*grid_h));
label(graphic("RVEcshud.png","height=2cm"),(col4_x, row4_y+0.1*grid_h));
label(scale(font_scale)*"$\delta_{min}$=1, $\beta$=1.512", (col3_x, row4_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{max}$=4, $\beta$=1.25", (col4_x, row4_y-0.37*grid_h));
// ===========================================
// =============== n-Lobe ====================
// ===========================================
pair C = (col1_x-grid_w*0.5, row5_y);
int n = 2;
real Ro = 6.0;
real r = 2.5;
real deltat = Ro/r;
real alpha = pi/n;
real k = 0.5 * (deltat-1.0) * sin(alpha);
real theta2 = asin(k);
real theta1 = alpha + theta2;
pair C1 = (C.x + Ro - r, C.y);
pair P1 = (C.x + Ro, C.y);
pair T1 = (C.x + Ro - r + (r * cos(theta1)), C.y + r*sin(theta1));
pair C2 = (C.x + Ro - r + (2 * r * cos(theta1)), C.y + 2.0 * r * sin(theta1));
pair P2 = (C2.x + (r*cos(pi + alpha)), C2.y + (r*sin(pi + alpha)));
//
path half_tip = arc(C1, P1, T1, CCW)--arc(C2, T1, P2, CW);
path unit_tip = reverse(reflect(C, P1)*half_tip) -- (half_tip); 
path[] tips={unit_tip};
for (int tipNum = 1; tipNum < n; ++tipNum) {tips.push(rotate((360/n)*tipNum, C)*unit_tip);}
filldraw(buildcycle(... tips), gray(0.75), blackPen);
draw(circle(C, Ro), gray(0.0)+dashed+linewidth(0.2));  // OUTER CIRCLE
draw(circle(C1, r), gray(0.0)+dashed+linewidth(0.2));  // LOBE
draw(circle(C2, r), gray(0.0)+dashed+linewidth(0.2));  // LOBE
// 
// labels
dot(scale(font_scale)*" ", C, S);
dot(scale(font_scale)*" ", C1, E);
dot(scale(font_scale)*" ", C2, W);
draw(C1--C2--C, dashed+linewidth(0.3));
markangle(Label(scale(font_scale)*" ", Relative(0.5)), n=1, radius=-6, C1, C2, C); // ANGLE LABEL
label(scale(font_scale)*"$\theta$", C2, E);
pair a_periphery_point = (C.x+Ro*cos(alpha), C.y+Ro*sin(alpha));
draw(C--a_periphery_point, Arrow);
label(scale(font_scale)*"$R_o$", a_periphery_point, NW);
pair a_lobe_periphery_point = (C1.x+r*cos(1.45*pi), C1.y+r*sin(1.45*pi));
draw(C1--P1, Arrow);
label(scale(font_scale)*"$r$", P1, SE);
//
// Formulae
label(scale(font_scale)*"\textbf{n-lobe shape}", (col2_x, row5_y+0.4*grid_h));
label(scale(font_scale)*"$\delta = [\frac{R_o}{r} - 1]\sin\frac{\pi}{n} - 1 = 2 \sin\theta - 1 \in [0, 1]$", (col2_x, row5_y+0.2*grid_h));
label(scale(font_scale)*"$\mathbf{P}$=$2 \pi r + 4 n r \theta$", (col2_x, row5_y+0.0*grid_h));
label(scale(font_scale)*"$\mathbf{A}$=$\pi r^2 + 2 n r (R_o - r) \sin(\frac{\pi}{n}+\theta)$", (col2_x, row5_y-0.2*grid_h));
label(graphic("RVE2Lld.png","height=2cm"),(col3_x, row5_y+0.1*grid_h));
label(graphic("RVE2Lud.png","height=2cm"),(col4_x, row5_y+0.1*grid_h));
label(scale(font_scale)*"$n$=2;", (col3_x-0.65*grid_w, row5_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{min}$=0.1, $\beta$=1.182", (col3_x, row5_y-0.37*grid_h));
label(scale(font_scale)*"$\delta_{max}$=0.5, $\beta$=1.382", (col4_x, row5_y-0.37*grid_h));