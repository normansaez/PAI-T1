%% Procesamiento Avanzado de Imagenes
clear all;
close all;

k = [1 3 4 7 7.5 10 20 25];
%k = [0 1 2 3 4 5 6 7];
n = 3;
p_x_1 = [1 2 3 4];
p_y_1 = [1 2 2.5 1.5];
p_x_2 = [2 3 4 5.5];
p_y_2 = [2 2.5 1.5 3];



pps = 100;
x = size(1:1:401);
y = size(1:1:401);
count = 1;
for s=1:1:length(p_x_1)
    try
        step_x_1 = (p_x_1(s+1) - p_x_1(s))/pps;
        step_y_1 = (p_y_1(s+1) - p_y_1(s))/pps;
        step_x_2 = (p_x_2(s+1) - p_x_2(s))/pps;
        step_y_2 = (p_y_2(s+1) - p_y_2(s))/pps;
    catch err
        break
    end
    t_x_1 = p_x_1(s):step_x_1:p_x_1(s+1);
    t_y_1 = p_y_1(s):step_y_1:p_y_1(s+1);
    t_x_2 = p_x_2(s):step_x_2:p_x_2(s+1);
    t_y_2 = p_y_2(s):step_y_2:p_y_2(s+1);
    
    x1 = size(1:1:pps);
    y1 = size(1:1:pps);
    
    x2 = size(1:1:pps);
    y2 = size(1:1:pps);
    
    
    for i=1:1:pps
        tx1 =t_x_1(i);
        ty1 =t_y_1(i);
        x1(i) = pol_c(tx1,n,k,p_x_1);
        y1(i) = pol_c(ty1,n,k,p_y_1);
        
        tx2 =t_x_2(i);
        ty2 =t_y_2(i);
        x2(i) = pol_c(tx2,n,k,p_x_2);
        y2(i) = pol_c(ty2,n,k,p_y_2);
        
        x(count) = x1(i);
        y(count) = y1(i);
        count = count + 1;
    end
end

for i=1:1:pps
    x(count) = y1(i);
    y(count) = y2(i);
    count = count +1;
end
plot(p_x_1,p_y_1,'bx')
hold
plot(p_x_2,p_y_2,'bx')
hold
plot(x,y,'r')
hold
%count