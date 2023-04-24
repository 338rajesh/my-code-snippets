settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;
//
import three;
import graph3;
import markers;
//
currentprojection=orthographic(8,4,2);
size(10cm);
size3(3cm,5cm,8cm);
// DRAWING AXES
real b=1.5;
label("$\rm O$",(0,0,0),-1.5*Y-X);
draw(Label("$x$",1), O--b*X, Arrow3);
draw(Label("$y$",1), O--b*Y, Arrow3);
draw(Label("$z$",1),O--b*Z, Arrow3);
// draw(O--(-1.5*b)*X, Arrow3);
// draw(O--(-b)*Y, Arrow3);
//
// ==============================================
//              ith UnS
// ==============================================
//
real a=1, phi_i=60, theta_i=60;
pen pen_q_i = red + linewidth(1.0);
triple Q_i=a*dir(phi_i,theta_i);
draw(O--2.5*Q_i,align=5*dir(90,theta_i),arrow=Arrow3, p = pen_q_i);
// DRAWING dashed lines
dot(Q_i);
label("$\mathbf{x}_i$", Q_i, N);
draw(Q_i--(Q_i.x,Q_i.y,0), p=dotted+linewidth(1.0)+red  );
real xy_proj = sqrt(Q_i.x^2+Q_i.y^2);
draw(O--xy_proj*dir(90,theta_i), p=dotted+linewidth(1.0)+red);
draw("$\varphi_i$",arc(O,0.25*Z,0.15*Q_i),align=1.0*dir(phi_i*0.8,theta_i*1.2),Arrow3, p=pen_q_i);
draw("$\theta_i$",arc(O,0.30*X,0.30*dir(90, theta_i)),align=9.0*a*dir(90,theta_i*0.3)+Z,Arrow3, p=pen_q_i);

//
// ==============================================
//              jth UnS
// ==============================================
//
real a_j=0.5, phi_j=-50, theta_j=-10;
pen pen_q_j = blue + linewidth(0.5);
// DRAWING dashed lines
triple O_j = a_j*(1.0, 2.5, 0.0);
triple Q_j = a_j*(-1.5, 0.5, 2.0);
dot(O_j);
label("$\mathbf{O}_j$", O_j+(O_j.x*0.0, -O_j.y*0.07, 0.0), W);
dot(L = Label("$\mathbf{x}_j$", E), Q_j);
draw(O_j--(Q_j+(0.30*(Q_j-O_j))),align=2*dir(90,theta_j),arrow=Arrow3, p = pen_q_j);
triple ojx = (O_j+(0.3*X));
triple ojy = (O_j+(0.3*Y));
triple ojz = (O_j+(0.3*Z));
draw(O_j--ojx, pen_q_j);
draw(O_j--ojy, pen_q_j);
draw(O_j--ojz, pen_q_j);
triple oqj = O_j + 0.05*(Q_j-O_j);
//
draw(Q_j--(Q_j.x,Q_j.y,0.0), p = dotted+linewidth(0.5)+blue);
draw(O_j--(Q_j.x,Q_j.y,0.0), p = dotted+linewidth(0.5)+blue);
//
draw("$\varphi_j$",arc(O_j,O_j+(0.25*Z), oqj),align=2.5*dir(phi_j*0.3,theta_j*1.5),Arrow3, p=pen_q_j);
triple xy_proj_angPnt = O_j + (0.25*(Q_j.x-O_j.x, Q_j.y-O_j.y, 0.0));
draw("$\theta_j$",arc(O_j, O_j+(0.25*X), xy_proj_angPnt, direction=CW),align=9.0*dir(80,-theta_j*3.5)+Z, Arrow3, p=pen_q_j);
//
//




