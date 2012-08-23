function [sum,B,n_sum,n_mul] = pol_c(t,n,k,p,n_sum,n_mul)
sum = 0;
B = size(n,1);
for i=1:1:n
    [b, n_sum, n_mul] = cox_de_boor(n,i,t,k,n_sum,n_mul);
    B(i) = b;
    sum = b*p(i)+sum;
    n_sum = n_sum +1;
    n_mul = n_mul +1;
end