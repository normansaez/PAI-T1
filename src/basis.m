function [b,n_sum,n_mul] = basis(t,n,k,n_sum,n_mul)
b = size(n,1);
for i=1:1:n
    [b(i), n_sum, n_mul] = cox_de_boor(n,i,t,k,n_sum,n_mul);
    %fprintf('B(%g,%g) = %g\n',n,i,b(i));
end