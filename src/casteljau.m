function b = casteljau(p, i, j, t)
if j == 0
    %fprintf('j=%g\n',j);
    b = p(i);
    %fprintf('B=%g; p(i)=%g, i=%g\n',b,p(i),i);
else
    %fprintf('B(%g %g)*(t=%g)+B(%g %g)*(t=%g)\n',i,j-1,1-t,i+1,j-1,t);
    %pause
    b = casteljau(p, i, j - 1, t) * (1 - t) + casteljau(p, i + 1, j - 1, t) * t;
    %fprintf('B=%g\n',b);
end
