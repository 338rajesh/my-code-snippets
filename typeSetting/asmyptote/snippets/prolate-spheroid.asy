settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three; 

currentprojection=orthographic(4,2,2);
size3(30cm,50cm,80cm);

real smj = 2.5, smn = 1.0;
real ecc = sqrt(1 - (smn^2 / smj^2));
real x0 = smj * ecc * ecc;
int n = 20;

for (int i=0; i<n; ++i){
  real xi = x0 * (((2.0*i)/n) - 1.0);
  real ri = smn * sqrt(1 - (xi^2/(smj*x0)));
  draw(shift((xi, 0.0, 0.0))*scale3(ri)*unitsphere, red); 
}