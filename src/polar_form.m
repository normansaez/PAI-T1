function [ttt] = polar_form(P,t,K)
% iter 0
r1r2r3 = P(1);
r1r2s1 = P(2);
r1s1s2 = P(3);
s1s2s3 = P(4);
 
r1 = K(1);
r2 = K(2);
r3 = K(3);

s1 = K(4);
s2 = K(5);
s3 = K(6);

% iter 1

r1r2t = ((s1 - t)/(s1-r3))*r1r2r3 + ((t - r3)/(s1 - r3))*r1r2s1;
r1s1t = ((s2 - t)/(s2-r2))*r1r2s1 + ((t - r2)/(s2 - r2))*r1s1s2;
s1s2t = ((s3 - t)/(s3-r1))*r1s1s2 + ((t - r1)/(s3 - r1))*s1s2s3;

% iter 2
r1t1t = ((s1 - t)/(s1-r2))*r1r2t + ((t - r2)/(s1 - r2))*r1s1t;
s1t1t = ((s2 - t)/(s2-r1))*r1s1t + ((t - r1)/(s2 - r1))*s1s2t;

% iter 3
ttt = ((s1 - t)/(s1-r1))*r1t1t + ((t - r1)/(s1 - r1))*s1t1t;