# Tips for Asymptote

## Drawing tips

+ In draw() method
  + passing `Arrows` or `BeginArrow` or `MidArrow` or `EndArrow` adds arrow heads
  + passing `Bars` adds prpendicular bars to arrow head
  
  + Arrows 
    * void draw_inward_arrows(pair z1, pair z2, real bar_len){
      real theta = atan2(z2.y-z1.y, z2.x-z1.x);
      real blx = bar_len * cos(theta), bly = bar_len * sin(theta);
      draw(z1 - (blx, bly) -- z1, EndArrow(), EndBar());
      draw(z2 -- z2 + (blx, bly), BeginArrow(), BeginBar());
    }

  `draw(z, Arrows, Bars)`

  + To reverse the direction of arrow head, reverse the directio of the path

+ `Label()`
  + Label(minipage("\flushleft{\begin{itemize}\item[3.]Determine desired bird survival for next season\end{itemize}}", 90 ), align=SW,)
  + label(format("%4.2f",arclength(p)), p, SE); // for adding variables to strings
  
+ Angle marks
  import geometry;
  markangle(
    Label("$\theta$",Relative(0.5)),
    n=1, // Number of marker layers
    radius=10,  // negative values takes marker to the other side
    point(arb_inner, 1),  // Points 
    point(arb_inner, 2), // Point at Angle
    point(arb_inner, 3),  // Points 
    red  // pen
  );



### Arrays
+ `real[] A = {5.0, 60.0, 23.3};` defines a 1D array of real numbers
+ `A.length` gives 3



### File handling
+ In latex write the asy code in a file, for example `drawing.asy`
+ Then place the following code in \begin{asy} ... \end{asy} environment
  `include "/path/to/drawing.asy";`



+ `usepackage("amsfonts");` replace `amsfonts` with required latex package 
+ 