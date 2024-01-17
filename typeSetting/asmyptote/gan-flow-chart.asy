size(450.0);
usepackage("amsmath");
defaultpen(fontsize(8pt));
pair[] draw_rounded_rectangle(
    real a=2.0, real b=1.0,
    pair cent = (0.0, 0.0),
    real rc=0.1,
    real theta = 45.0,
    pen fc = lightgrey,
    pen bc = black,
    string lbl = "",
    pair lbl_pnt = (0.0, 0.0)
){
    path q1 = ((a, 0.0) -- arc((a-rc, b-rc), (a, b-rc), (a-rc, b)) -- (0, b));
    path q2 = reflect((0.0, 0.0), (0.0, b)) * q1;   
    path q3 = reflect((0.0, 0.0), (a, 0.0)) * q2;  
    path q4 = reflect((0.0, 0.0), (a, 0.0)) * q1;  
    path rect_path = q1--reverse(q2)--q3--reverse(q4)--cycle;
    rect_path = shift(cent)*rotate(theta)*rect_path;
    filldraw(rect_path, fc, bc);
    label(rotate(theta)*minipage("\centering "+lbl), cent);
    pair[] hooks = {
        cent+(a*cos(radians(theta+0)), a*sin(radians(theta+0))),
        cent+(b*cos(radians(theta+90)), b*sin(radians(theta+90))),
        cent+(a*cos(radians(theta+180)), a*sin(radians(theta+180))),
        cent+(b*cos(radians(theta+270)), b*sin(radians(theta+270)))
    };
    return hooks;
}


real h=2.5, dh = 0.75;
pair[] hooks_1 = draw_rounded_rectangle(h*1.4, h/2, cent=(-1.0*(h + dh), 0.0), theta=0.0, lbl="Latent Space, $\mathcal{Z}$");
pair[] hooks_2 = draw_rounded_rectangle(2*h, 2*h, cent=(2.2*(h + dh), 0.0), theta=0.0, fc=white, bc=dotted+linewidth(1.5));
pair[] hooks_21 = draw_rounded_rectangle(h*1.3, h/2, cent=(2.2*(h + dh), -h), theta=0.0, lbl="Control Points", fc=gray(0.6));
pair[] hooks_22 = draw_rounded_rectangle(h*1.3, h/2, cent=(2.2*(h + dh), h), theta=0.0, lbl="Parametric Points", fc=gray(0.6));
pair[] hooks_3 = draw_rounded_rectangle(h, h/2, cent=(5.0*(h + dh), 0.0), theta=0.0, lbl="Synthetic\\Samples, $\mathcal{X}_\text{gen}$");
pair[] hooks_4 = draw_rounded_rectangle(h, h/2, cent=(5.0*(h + dh), h + dh), theta=0.0, lbl=("Training\\Samples, $\mathcal{X}_\text{tr}$"));
pair[] hooks_5 = draw_rounded_rectangle(h, h/2, cent=(7.0*(h + dh), h/2 + dh), theta=0.0, lbl=("Critic, $\mathcal{C}(\theta_c)$"), fc=gray(0.6));
pair[] hooks_6 = draw_rounded_rectangle(h, h/2, cent=(9.0*(h + dh), h/2 + dh), theta=0.0, lbl=("Loss, $\mathcal{L}$,\\Evaluation"), fc=gray(0.9));


draw(hooks_1[0]--hooks_21[2], EndArrow());
draw(hooks_1[0]--hooks_22[2], EndArrow());
draw(hooks_21[0]--hooks_3[2], EndArrow());
draw(hooks_22[0]--hooks_3[2], EndArrow());
draw(hooks_3[0]--hooks_5[2], MidArrow());
draw(hooks_4[0]--hooks_5[2], MidArrow());
draw(hooks_5[0]--hooks_6[2], EndArrow());
draw(
    hooks_6[3] -- (hooks_6[3].x, hooks_2[3].y * 1.5) -- (hooks_2[3].x, hooks_2[3].y * 1.5) -- hooks_2[3], dashed,
    EndArrow()
);
draw(
    hooks_6[1] -- (hooks_6[1].x, hooks_6[1].y * 1.5)
    -- (hooks_5[1].x, hooks_5[1].y * 1.5) -- hooks_5[1], dashed,
    EndArrow()
);
