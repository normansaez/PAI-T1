function [result,n_sum,n_mul] = cox_de_boor(n,i,t,k,n_sum,n_mul)
%fprintf('n=%g == 1 ?\n',n);
if n == 1
    if k(i)<= t && t < k(i+1)
%        fprintf('k(%g)=%g <= t=%g < k(%g)=%g\n',i,k(i),t,i+1,k(i+1));
%        fprintf('yes r = 1\n');
        result = 1;
        return;
    else
        result = 0;
%        fprintf('k(%g)=%g <= t=%g < k(%g)=%g\n',i,k(i),t,i+1,k(i+1));
%        fprintf('no r = 0\n');
        return;
    end
else
    n_sum = n_sum + 5;
    n_mul = n_mul + 2;
    %fprintf('n=%g == 1 then:\n',n);
    %fprintf('a: cox n-->n-1:%g i=%g, t=%g \n',n-1,i,t);
    %fprintf('b: cox n-->n-1:%g i+1=%g, t=%g \n',n-1,i+1,t);
    [c,n_sum,n_mul] = cox_de_boor(n-1,i,t,k,n_sum,n_mul);
    [d,n_sum,n_mul] = cox_de_boor(n-1,i+1,t,k,n_sum,n_mul);
    result = (((t-k(i))*c)/(k(i+n-1)-k(i))) + ((k(i+n)-t)*d)/(k(i+n)-k(i+1));
    %result = (((t-k(i))*cox_de_boor(n-1,i,t,k,n_sum,n_mul))/(k(i+n-1)-k(i))) + ((k(i+n)-t)*cox_de_boor(n-1,i+1,t,k,n_sum,n_mul))/(k(i+n)-k(i+1));
end