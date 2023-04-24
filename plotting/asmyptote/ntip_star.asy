real drsize = 200.0;
size(drsize);
//
// ======= INPUT SECTION ======
//
pair C  = (0.0, 0.0); // centre of the shape
real rb=1.0;
int n=6;
real alpha=pi/n;
real rbf_factor = 0.4;
real beta_factor = 0.75;
real rtf_factor = 0.4;
//
//
// beta evaluation
real beta = alpha + (beta_factor * ((0.5*pi) - alpha));
// rbf evaluation
real rbf_max = rb * (sin(alpha)/(1-sin(alpha)));
real rbf = rbf_factor * rbf_max;
// rtf evaluation
real k10 = sin(alpha)/sin(beta);
real k111 = ((1.0-sin(alpha)) - (sin(beta)-sin(alpha))*rbf_factor) / sin(beta);
real rtf_max = k111 * rbf_max;
real rtf = rtf_factor * rtf_max;
// ro evaluation
real k2 = sin(beta-alpha)/sin(beta);
real k3 = 1/cos(beta);
real ro = ((rb + rbf)*k2) + rtf + ((rtf_max-rtf)*k3);
// 
//
// Defing Centres of base fillet and tip fillet circles
pair C1 = (C.x + (rb+rbf)*cos(alpha), C.y + (rb+rbf)*sin(alpha));
pair C2 = (C.x + ro-rtf, C.y);
// Defining Tangent points of base fillet and tip fillet circles
pair T1 = (C1.x - (rbf*cos(beta)), C1.y - (rbf*sin(beta)));
pair T2 = (C2.x + (rtf*cos(beta)), C2.y + (rtf*sin(beta)));
// Defining the contact point point of base and base fillet circle
pair T3 = (C.x + (rb*cos(alpha)), C.y + (rb*sin(alpha)));
// Defining point of half tip on the outer circle.
pair P  = (C.x + ro, C.y);
//
path baseCircle=circle(C, rb);
path baseFilletCircle=circle(C1, rbf);
path tipCircle=circle(C2, rtf);
path outerCircle=circle(C, ro);
path halfTip=(C--P--arc(C2, P, T2)--T1--arc(C1, T1, T3, CW)--T3--C--cycle);
path halfTip2=reflect(C, P)*halfTip;
path outerHalfTip=(arc(C2, P, T2)--T1--arc(C1, T1, T3, CW));
path outerHalfTipRef=reflect(C,P)*outerHalfTip;
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// ~~~~~~~~~~~~ defining pens ~~~~~
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pen dashedPen1=blue+linetype(new real[] {20, 20})+linewidth(0.1);
pen dashedPen2=red+linetype(new real[] {5, 5})+linewidth(0.2);
pen solidPen1=red+linewidth(0.5);
//
//
draw(halfTip2, dashedPen2);
draw(baseFilletCircle, dashedPen1);
draw(tipCircle, dashedPen1);
// Making copies of tips
for (int tipNum = 1; tipNum < n; ++tipNum) {
  draw(rotate((360/n)*tipNum)*outerHalfTip, solidPen1);
  draw(rotate((360/n)*tipNum)*outerHalfTipRef, solidPen1);
  draw(rotate((360/n)*tipNum)*baseFilletCircle, dashedPen1);
  draw(rotate((360/n)*tipNum)*tipCircle, dashedPen1);
}
filldraw(baseCircle, white, dashedPen1);
draw(outerCircle, dashedPen1);
//
filldraw(halfTip, grey);
//
// labelling
pen black_dot = black+(0.008*drsize);
//dot(C, black_dot);
//label("$C$",C,1.2N, black);
draw(C--T3,EndArrow);
label("$r_b$", (0.5*(C.x+T3.x), 0.5*(C.y+T3.y)) ,1.2N, black);
//dot(C2, black_dot);
//label("$C_2$",C2,1.2N, black);
//dot(C1, black_dot);
//label("$C_1$",C1,1.2N, black);
draw(C1--T3,EndArrow);
label("$r_{bf}$", (0.5*(C1.x+T3.x), 0.5*(C1.y+T3.y)) ,1.4E, black);
draw(C2--P,EndArrow);
label("$r_{tf}$", (P.x, P.y) ,1.2NE, black);
