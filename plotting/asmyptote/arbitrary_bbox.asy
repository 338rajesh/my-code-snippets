size(200.5,200.5);
import markers;
import graph;

real t = 3.0;
//
label("$\Omega$",(-0.80*t, 0.80*t),S);
//
pair a1 = (1.00*t, 1.00*t);
pair a2 = (0.50*t, 1.10*t);
pair a3 = (0.00*t, 1.00*t);
pair a4 = (-0.50*t, 0.90*t);
pair a5 = (-1.0*t, 1.00*t);
//
pair b1 = (-1.0*t, 1.00*t);
pair b2 = (-1.1*t,  0.50*t);
pair b3 = (-1.0*t,  0.00*t);
pair b4 = (-0.9*t,  -0.50*t);
pair b5 = (-1.0*t,  -1.00*t);
//
pair c1 = (-1.0*t,  -1.00*t);
pair c2 = (-0.5*t, -1.10*t);
pair c3 = (-0.0*t,  -1.00*t);
pair c4 = (0.5*t,  -0.90*t);
pair c5 = (1.0*t,  -1.00*t);
//
pair d1 = (1.0*t,  -1.00*t);
pair d2 = (1.1*t, -0.5*t);
pair d3 = (1.0*t, 0.0*t);
pair d4 = (0.9*t, 0.5*t);
pair d5 = (1.00*t, 1.00*t);
//
path rve_bbox = (a1..a2..a3..a4..a5..b1..b2..b3..b4..b5..c1..c2..c3..c4..c5..d1..d2..d3..d4..d5..cycle);
fill(rve_bbox, lightgray);
draw(rve_bbox, black);
//
// ==============================================================
//                      UnS-i
// ==============================================================
//
pen pen_i = red + linewidth(0.35*t);
draw((-0.6*t,-0.7*t)--(0.83*t,0.29*t), pen_i,  arrow=Arrow(TeXHead));
pair pivot_xi = (0.18*t, -0.16*t);
pair k1_i = (0.70*t, 0.11*t);
pair k2_i = (0.57*t, 0.11*t);
pair k3_i = (0.70*t, 0.20*t);
draw((k1_i+(0.05*t,0.0))--k2_i, pen_i);
markangle(Label(scale(1.0)*"$\theta_i$", SE),radius=4.0*t, k1_i, k2_i, k3_i, ArcArrow(2.5mm), pen_i);
//
// DRAWING CIRCLES
draw(circle(pivot_xi, 0.25*t), pen_i);
// draw(circle(pivot_xi, 0.25*t),red+linewidth(0.25*t));
draw(circle(pivot_xi + (0.25*t, 0.17*t), 0.14*t),pen_i);
draw(circle(pivot_xi + (-0.05*t, 0.20*t), 0.14*t),pen_i);
draw(circle(pivot_xi + (0.10*t, 0.32*t), 0.15*t),pen_i);
draw(circle(pivot_xi + (-0.20*t, -0.20*t), 0.16*t),pen_i);
//draw(circle(pivot_xi + (0.05*t, -0.20*t), 0.14*t),pen_i);
draw(circle(pivot_xi + (-0.10*t, -0.32*t), 0.15*t),pen_i);
draw(circle(pivot_xi + (0.40*t, -0.05*t), 0.22*t),pen_i);
//
dot(pivot_xi);
label("$\textbf{x}_i$", pivot_xi, SE);
dot(pivot_xi + (0.40*t, -0.05*t));
label("$\textbf{x}_{ik}$", pivot_xi + (0.38*t, -0.10*t), S);
//
//
// ==============================================================
//                      UnS-j
// ==============================================================
//
pen pen_j = blue + linewidth(0.15*t);
draw((-0.4*t,-0.7*t)--(0.2*t,0.8*t), pen_j,  arrow=Arrow(TeXHead));
pair pivot_xj = (-0.22*t, -0.25*t);
pair k1_j = (0.15*t, 0.35*t);
pair k2_j = (0.02*t, 0.35*t);
pair k3_j = (0.08*t, 0.50*t);
draw(k1_j--k2_j, pen_j);
markangle(scale(1.0)*"$\theta_j$",radius=3.5*t, k1_j, k2_j, k3_j, ArcArrow(1mm), pen_j);
//
//
// DRAWING CIRCLES
draw(circle(pivot_xj, 0.25*t), pen_j);
draw(circle(pivot_xj + (0.20*t, 0.20*t), 0.16*t),pen_j);
draw(circle(pivot_xj + (-0.05*t, 0.20*t), 0.14*t),pen_j);
draw(circle(pivot_xj + (0.06*t, 0.33*t), 0.20*t),pen_j);
draw(circle(pivot_xj + (-0.20*t, -0.25*t), 0.16*t),pen_j);
draw(circle(pivot_xj + (0.05*t, -0.20*t), 0.14*t),pen_j);
draw(circle(pivot_xj + (-0.05*t, -  0.32*t), 0.15*t),pen_j);
//
dot(pivot_xj);
label("$\textbf{x}_j$", pivot_xj, W);
dot(pivot_xj  + (0.06*t, 0.33*t));
label("$\textbf{x}_{jl}$", pivot_xj  + (0.06*t, 0.33*t) , N);
//
pair ax_origin = (-1.25*t,-1.25*t);
draw(ax_origin--(-1.00*t, -1.25*t), arrow=Arrow(TeXHead));
draw(ax_origin--(-1.25*t, -1.00*t), arrow=Arrow(TeXHead));
label("$x$", (-1.00*t, -1.25*t), E);
label("$y$", (-1.25*t, -1.00*t), N);
//
label("$i^{th} inclusion$", (0.65*t, -0.5*t), S);
label("$j^{th} inclusion$", (-0.6*t, 0.5*t), S);

