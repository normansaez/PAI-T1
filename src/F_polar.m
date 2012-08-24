function [F] = F_polar(x1,x2,x3,P)
a = P(1);
b = P(1);
c = P(1);
d = P(1);
 
F = a*x1*x2*x3 + b*(1/3)*(x1*x2+x1*x3+x2*x3)+ c*(1/3)*(x1+x2+x3) + d;