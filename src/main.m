%% Procesamiento Avanzado de Imagenes
%  Tarea N1
%  mailto: nfsaez@uc.cl
%%

tic;
clear all;
close all;

k = [1 3 4 7 7.5 10 20 25];
n = 3;

p_x_1 = [1 2 3 4];
p_y_1 = [1 2 2.5 1.5];
p_x_2 = [2 3 4 5.5];
p_y_2 = [2 2.5 1.5 3];

pps = 100;

x = size(1:1:length(k)*pps);
y = size(1:1:length(k)*pps);
x1 = size(1:1:pps);
y1 = size(1:1:pps);
x2 = size(1:1:pps);
y2 = size(1:1:pps);
count = 1;

for s=1:1:length(k)
    try
        step = (k(s+1) - k(s))/pps;
    catch err
        break
    end
    T = k(s):step:k(s+1);
    
    for i=1:1:pps
        t =T(i);
        
        x1(i) = pol_c(t,n,k,p_x_1);
        y1(i) = pol_c(t,n,k,p_y_1);
        
        x2(i) = pol_c(t,n,k,p_x_2);
        y2(i) = pol_c(t,n,k,p_y_2);
        
        x(count) = x1(i);
        y(count) = y1(i);
        count = count + 1;
    end
end

for i=1:1:pps
    x(count) = x2(i);
    y(count) = y2(i);
    count = count + 1;
end

figure, 
plot(x,y,'r')
hold on
plot(p_x_1,p_y_1,'b*')
hold on
plot(p_x_2,p_y_2,'b*')
hold on

totaltime = toc;
fprintf('\nExecution time %.2f[min] or %.2f [sec]\n', totaltime/60, totaltime);


