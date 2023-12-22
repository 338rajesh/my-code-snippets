size(300, 300);
// 
// Input

path n_tip_star(
  pair C = (0.0, 0.0),
  real rb=1.0,
  int num_tips=6,
  real rbf_factor = 0.05,
  real beta_factor = 0.75,
  real rtf_factor = 0.4,
  bool draw_half_tip = false
){
    real alpha=pi/num_tips;
    //
    // beta:: (pi/2 + beta) is slope of common tangent to base fillet and tip fillet
    real beta = alpha + (beta_factor * ((0.5*pi) - alpha));
    //
    // rbf:: base fillet radius evaluation
    real rbf_max = rb * (sin(alpha)/(1-sin(alpha)));
    real rbf = rbf_factor * rbf_max;
    //
    // rtf:: tip fillet radius evaluation
    real k10 = sin(alpha)/sin(beta);
    real k111 = ((1.0-sin(alpha)) - (sin(beta)-sin(alpha))*rbf_factor) / sin(beta);
    real rtf_max = k111 * rbf_max;
    real rtf = rtf_factor * rtf_max;
    //
    // ro:: Outer radius evaluation
    real k2 = sin(beta-alpha)/sin(beta);
    real k3 = 1/cos(beta);
    real ro = ((rb + rbf)*k2) + rtf + ((rtf_max-rtf)*k3);
    // 
    //
    // Defing Centres of base fillet and tip fillet circles
    pair C_bf = (C.x + (rb+rbf)*cos(alpha), C.y + (rb+rbf)*sin(alpha));
    pair C_tf = (C.x + ro-rtf, C.y);
    // Defining Tangent points of base fillet and tip fillet circles
    pair T_bf = (C_bf.x - (rbf*cos(beta)), C_bf.y - (rbf*sin(beta)));
    pair T_tf = (C_tf.x + (rtf*cos(beta)), C_tf.y + (rtf*sin(beta)));
    // Defining the contact point of base circle and base fillet circle
    pair P_bbf = (C.x + (rb*cos(alpha)), C.y + (rb*sin(alpha)));
    // Defining point of half tip on the outer circle.
    pair P_tip  = (C.x + ro, C.y);
    //
    path half_tip = P_tip -- T_tf -- T_bf -- P_bbf;
    path[] tips={half_tip};
    for (int tipNum = 1; tipNum < num_tips; ++tipNum){
      tips.push(rotate((360/n)*tipNum, C)*half_tip);
    }
    return buildcycle(... tips);


    path baseCircle=circle(C, rb);
    path baseFilletCircle=circle(C1, rbf);
    path tipCircle=circle(C2, rtf);
    path outerCircle=circle(C, ro);
    path halfTip=(C--P--arc(C2, P, T2)--T1--arc(C1, T1, T3, CW)--T3--C--cycle);
    path halfTip2=reflect(C, P)*halfTip;
    path outerHalfTip=(arc(C2, P, T2)--T1--arc(C1, T1, T3, CW));
    path outerHalfTipRef=reflect(C,P)*outerHalfTip;
    pen dashedPen1=blue+linetype(new real[] {20, 20})+linewidth(0.1);
    pen dashedPen2=red+linetype(new real[] {5, 5})+linewidth(0.2);
    pen solidPen1=red+linewidth(0.5);
    //
    draw(halfTip2, dashedPen2);
    draw(tipCircle, dashedPen1);
    // Making copies of tips
    for (int tipNum = 1; tipNum < n; ++tipNum) {
      draw(rotate((360/n)*tipNum)*outerHalfTip, solidPen1);
      draw(rotate((360/n)*tipNum)*outerHalfTipRef, solidPen1);
      draw(rotate((360/n)*tipNum)*tipCircle, dashedPen1);
    }
    filldraw(baseCircle, white, dashedPen1);
    draw(outerCircle, dashedPen1);
    filldraw(halfTip, grey);
    pen black_dot = black+(0.1);
    draw(C--T3,EndArrow);
    label("$r_b$", (0.5*(C.x+T3.x), 0.5*(C.y+T3.y)) ,1.2N, black);
    draw(C2--P,EndArrow);
    label("$r_{tf}$", (P.x, P.y) ,1.2NE, black); 
}