size(0,300);

import flowchart;
 size(200.0, 200.0);
// 
// Preliminaries
real sep=35.0;
pair O = (0.0, 0.0);
pair O_atc = O + (0.0, 0.0);
pair O_mrb = O + (0.0, 1.5*sep);
pair O_rnt = O + (0.0, 3.0*sep);
pair O_str = O + (0.0, 4.5*sep);
pen material_color = green; // gray(0.8);
pen border_pen = blue+linewidth(0.5);
int num_layers = 5;
//
//
path make_rotational_pattern(path unq_path, int num, pair org, pen fill_color=grey, pen border_color=black){
  path[] hands={unq_path};
  for (int hand_num = 0; hand_num < num; ++hand_num) {hands.push(rotate((360/num)*hand_num, org)*unq_path);}
  path closed_path = buildcycle(... hands);
  filldraw(closed_path, fill_color, border_color);  
  return closed_path;
}
//
//
path make_full_configuration(path unit_path, pair o, pair x, pair y,  pen fill_color=grey, pen border_color=black){
  path p1 = unit_path -- reverse(reflect(o, y)*unit_path);
  path p2 = p1 -- reverse(reflect(o, x)*p1)--cycle;     
  filldraw(p2, fill_color, border_color);
  return p2;
}
//
// Anti-Tetrchiral Auxetic
// real r = 5.0*t, l = L*0.3;
// real k = sqrt(t^2 + (2.0*r*t));
// pair P1 = (0.0, r+t), P2 = (l, r+t), P3 = (l, r), P4 = (k, r), P5 = (r+t, 0.0);
// path a_hand = shift(O_atc+(0.25*L, 0.25*L))*(arc(O, P5, P4, direction=CCW)--P3--P2--P1);
// path[] hands={};
// for (int hand_num = 0; hand_num < 4; ++hand_num) {hands.push(rotate(90*hand_num, O_atc+(0.25*L, 0.25*L))*a_hand);}
// path atc_a_quarter = buildcycle(... hands);
// make_full_configuration(atc_a_quarter, O_atc, O_atc + (1.0, 0.0), O_atc + (0.0, 1.0));
//make_rotational_pattern(a_hand, 4, O_atc, material_color, border_pen);
//filldraw(circle(O_atc, r), white, border_pen);

//
// Missing Rib Auxetic
real L = 6.5, t=2.4;
real h = t/sqrt(2);
pair P1=(h, 0.0), P2=((L/4) + h, L/4), P3=(h, L/2);
pair P4=(-h, L/2), P5=((L/4) - h, L/4), P6=(0.0, h);
path a_hand = shift(O_mrb) * (P1--P2--P3--P4--P5--P6);
path mrb_path = make_rotational_pattern(a_hand, 4, O_mrb, material_color, border_pen);
// for (int i=0; i < 3; ++i) {
//   for (int j=0; j < 4; ++j) {
//     filldraw(scale(0.35)*shift(L*(2.75+j), (1.5+i)*L)*mrb_path, grey, black+linewidth(0.2));
//   }
// }

//
// Re-entrant Auxetic
real L = 10.0, t=1.125, tht=pi/3;
real h1 = L*0.40, h2 = t/2, h3 = t/sin(tht), cot_tht = cos(tht)/sin(tht);
real k = h1 - h3 - ((h1-h2)*(cot_tht));
pair P1 = (h1, 0.0), P2 = (h1, h1), P3 = (h1-h2, h1);
pair P4 = (h2, k+h3+(h2*cot_tht)), P5 = (h2, k+h1), P6 = (0.0, k+h1);
pair Q1 = (h1-h2, 0.0), Q2 = (h1-h2, h1-h3), Q3 = (0.0, k);
path a_hand_outer_loop = shift(O_rnt) * (P1 -- P2--P3--P4--P5--P6);
path a_hand_inner_loop = shift(O_rnt) * (Q1 -- Q2--Q3);
path rnt_outer_path = make_full_configuration(a_hand_outer_loop, O_rnt, O_rnt+P1, O_rnt+P6, material_color, border_pen);
path rnt_inner_path = make_full_configuration(a_hand_inner_loop, O_rnt, O_rnt+P1, O_rnt+P6, white, border_pen);
// for (int i=0; i < 3; ++i) {
//   for (int j=0; j < 4; ++j) {
//     filldraw(scale(0.33)*shift((L+(0.0*k))*(3.5+j), (3.5+i)*(L+(2.0*k)))*rnt_outer_path, grey, black+linewidth(0.2));
//     filldraw(scale(0.33)*shift((L+(0.0*k))*(3.5+j), (3.5+i)*(L+(2.0*k)))*rnt_inner_path, white, black+linewidth(0.2));
//   }
// }
//
// Star shaped Auxetic
real L = 11.0, t=1.45, r = 8.0, tht=pi/4;
real beta = (0.75*pi) - (0.5*tht);
real h1 = (1/sin(beta)) * ((r*sin(tht/2)) - t);
real k1 = t/sin(0.5*tht);
real l1 = t/sin(beta) + (0.5 * (t/tan(pi-beta)));
pair P1 = O_str + (h1, 0.0), P2 = O_str + (L/2, 0.0), P3 = O_str + (L/2, t/2);
pair P4 = O_str + (h1+l1, t/2), P5 = O_str + (r*cos(pi/4), r*sin(pi/4)), P6 = O_str + (t/2, h1+l1);
pair P7 = O_str + (t/2, L/2), P8=O_str + (0.0, L/2), P9 = O_str + (0.0, h1);
pair P10 = O_str + ((r-k1)*cos(pi/4), (r-k1)*sin(pi/4));
path str_outer_path = make_rotational_pattern(P2--P3--P4--P5--P6--P7--P8, 4, O_str, material_color, border_pen);
path str_inner_path = make_rotational_pattern(P1 -- P10 -- P9, 4, O_str, white, border_pen);
// for (int i=0; i < 3; ++i) {
//   for (int j=0; j < 4; ++j) {
//     filldraw(scale(0.37)*shift(L*(2.5+j), (5.6+i)*L)*str_outer_path, grey, black+linewidth(0.2));
//     filldraw(scale(0.37)*shift(L*(2.5+j), (5.6+i)*L)*str_inner_path, white, black+linewidth(0.2));
//   }
// }