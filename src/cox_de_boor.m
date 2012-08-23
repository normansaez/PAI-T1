function [result,n_sum,n_mul] = cox_de_boor(n,i,t,k,n_sum,n_mul)
if n == 1
    if k(i)<= t && t < k(i+1)
        result = 1;
        return;
    else
        result = 0;
        return;
    end
else
    n_sum = n_sum + 5;
    n_mul = n_mul + 2;
    [c,n_sum,n_mul] = cox_de_boor(n-1,i,t,k,n_sum,n_mul);
    [d,n_sum,n_mul] = cox_de_boor(n-1,i+1,t,k,n_sum,n_mul);
    result = (((t-k(i))*c)/(k(i+n-1)-k(i))) + ((k(i+n)-t)*d)/(k(i+n)-k(i+1));
end