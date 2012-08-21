function [result] = cox_de_boor(n,i,t,k)
if n == 1
    if k(i)<= t && t < k(i+1)
        result = 1;
    else
        result = 0;
    end
else
    result = (((t-k(i))*cox_de_boor(n-1,i,t,k))/(k(i+n-1)-k(i))) + ((k(i+n)-t)*cox_de_boor(n-1,i+1,t,k))/(k(i+n)-k(i+1));
end