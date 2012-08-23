function [sum,n_sum,n_mul] = pol_c(t,n,k,p,n_sum,n_mul)
sum = 0;

for i=1:1:n
        [b, n_sum, n_mul] = cox_de_boor(n,i,t,k,n_sum,n_mul);
        sum = b*p(i)+sum;
        n_sum = n_sum +1;
        n_mul = n_mul +1;
        %fprintf('B(%g,%g) = %g\n',n, i,b);
        %fprintf('C(%g)= B(%g,%g)[%g]*P(%g) = %g\n',t,n, i,t, i,b*p(i));
end
%fprintf('C(%g) = %g \n',t,sum);
%fprintf('POL: n_sum =%g\nn_mul = %g\n',n_sum,n_mul);