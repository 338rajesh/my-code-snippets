\begin{figure}
    \centering
    \begin{asy}
        size(300.0, 300.0);
        pair C=(25.0, -20.0);
        real t = 15.0;
        //
        pair a1 = (C.x + 1.00*t,  C.y + 1.00*t);
        pair a2 = (C.x + 0.50*t,  C.y + 1.10*t);
        pair a3 = (C.x + 0.00*t,  C.y + 1.00*t);
        pair a4 = (C.x + -0.50*t, C.y + 0.90*t);
        pair a5 = (C.x + -1.0*t,  C.y + 1.00*t);
        path top_curve = a1..a2..a3..a4..a5;
        path left_curve = rotate(90, C)*top_curve;
        path bottom_curve = rotate(180, C)*top_curve;
        path right_curve = rotate(270, C)*top_curve;
        path rve_bbox = (top_curve..left_curve..bottom_curve..right_curve..cycle);
        real[] shf = {-2.0*t, 0.0, 2.0*t};
        for(int i=0;i<3;++i){
          for(int j=0;j<3;++j){
            if(i!=1 || j!=1){
            	filldraw(shift(shf[i], shf[j])*rve_bbox, lightgray, dashed+black+linewidth(0.4));
            }
            else{
        		filldraw(rve_bbox, grey, black);    
            }
          }
        }
        
        // Adding Inclusions
        //
        pair c_cent=(C.x-0.5*t, C.y+0.5*t);
        path ccl = circle(c_cent, 3.5);
        pair el1_cent = (C.x+0.6*t, C.y+0.8*t);
        path el1 = rotate(25.0, el1_cent)*ellipse(el1_cent, 2.8, 0.8);
        pair el2_cent = (C.x+0.5*t, C.y-0.4*t);
        path el2 = rotate(150.0, el2_cent)*ellipse(el2_cent, 5.0, 2.5);
        path[] incls = {ccl, el1, el2};
        for(int i; i<3;++i){
        	for(int j; j<3;++j){
              for(int k;k<3;++k){
                filldraw(shift(shf[i], shf[j])*incls[k], white, black);
              }    
            }
        }
        //
        // labeling
        draw(C--(C.x+0.0, C.y+3.5*t), dashed+linewidth(0.5), arrow=Arrow());
        draw(C--(C.x+3.5*t, C.y+0.0), dashed+linewidth(0.5), arrow=Arrow());
    \end{asy}
    \caption{\todo{Add labels and update the caption}}
    \label{fig:Repeating-Domain}
\end{figure}