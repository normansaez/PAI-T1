function [sum] = pol_c(t,n,k,p)
sum = 0;
for i=1:1:n
        b = cox_de_boor(n,i,t,k);
        sum = b*p(i)+sum;
        %fprintf('B(%g,%g)[%g]*P(%g) = %g\n',n, i,t, i,b*p(i));
end
fprintf('C(%g) = %g \n',t,sum);