%% Procesamiento Avanzado de Imagenes
%  Tarea N1
%  mailto: nfsaez@uc.cl
%%

tic;
clear all;
close all;

% N_k nodes
k = [1 3 4 7 7.5 10 20 25];
%k = [0 1 2 3 4 5 6 7];

% n = grade-1
n = 4;

% vector points seg 1: in x,y
p_x_1 = [1 2 3 4];
p_y_1 = [1 2 2.5 1.5];
% vector points seg 2: in x,y
p_x_2 = [2 3 4 5.5];
p_y_2 = [2 2.5 1.5 3];

%% control vars:
p_1_cox_de_boor = 1;
p_2_blossoming = 1;
p_3_beizer = 0;
p_4_casteljau = 1;

if p_1_cox_de_boor ==1
    % sums and multiplication counters
    % General counters
    n_sum = 0;
    n_mul = 0;
    
    %points per segment
    pps = 100;
    
    %final curve x(t),y(t)
    x = size(1:1:length(k)*pps);
    y = size(1:1:length(k)*pps);
    x1 = size(1:1:pps);
    y1 = size(1:1:pps);
    x2 = size(1:1:pps);
    y2 = size(1:1:pps);
    count = 1;
    
    b1_basis = size((length(k)-1)*pps,1);
    b2_basis = size((length(k)-1)*pps,1);
    b3_basis = size((length(k)-1)*pps,1);
    b4_basis = size((length(k)-1)*pps,1);
    t_basis = size((length(k)-1)*pps,1);
    
    %% Question 1
    
    for s=1:1:length(k)
        try
            % make step per each k, (break when s+1 exceeds the vector)
            step = (k(s+1) - k(s))/pps;
        catch err
            break
        end
        %Generate vector with t points between k(s+1) and k(s) with step (k(s+1) - k(s))/pps
        T = k(s):step:k(s+1);
        
        for i=1:1:pps
            t = T(i);
            %Calculate C(t)= (x(t),y(t)) segment 1
            [x1(i),B,n_sum,n_mul] = pol_c(t,n,k,p_x_1,n_sum,n_mul);
            [y1(i),~,n_sum,n_mul] = pol_c(t,n,k,p_y_1,n_sum,n_mul);
            if s == 7
                % Sums and multiplication counters
                % Reseting General counters, to count 100 points only
                
                n_sum = 0;
                n_mul = 0;
                
                %Calculate C(t)= (x(t),y(t)) segment 2
                %Only for the last 100 points:
                %(segment 1 has the first 300 points)
                
                [x2(i),~,n_sum,n_mul] = pol_c(t,n,k,p_x_2,n_sum,n_mul);
                [y2(i),~,n_sum,n_mul] = pol_c(t,n,k,p_y_2,n_sum,n_mul);
                
                % Dividing by 2 (x and y) couting for only one axis
                n_sum = n_sum/2;
                n_mul = n_mul/2;
            end
            %Basis
            b1_basis(count) = B(1);
            b2_basis(count) = B(2);
            b3_basis(count) = B(3);
            b4_basis(count) = B(4);
            t_basis(count) = t;
            %save in a x,y to plot the whole segment.
            x(count) = x1(i);
            y(count) = y1(i);
            count = count + 1;
        end
    end
    
    %save in a x,y to plot the whole segment (last 100 points)
    for i=1:1:pps
        x(count) = x2(i);
        y(count) = y2(i);
        count = count + 1;
    end
    fprintf('Cox de Boor:\n#sums = %g\n#mult = %g\n',n_sum,n_mul);
    
    %% Plot cuver in red. Control Points in blue
    figure,
    plot(x,y,'rx')
    hold on
    plot(p_x_1,p_y_1,'b*')
    hold on
    plot(p_x_2,p_y_2,'b*')
    hold on
    print(gcf,'-dpsc2','../img/img1a.eps');
    
    %% -----------------------------------------------------------------------------
    %Plot Basis
    figure,
    plot(t_basis, b1_basis,'r')
    hold on
    plot(t_basis, b2_basis,'g')
    hold on
    plot(t_basis, b3_basis,'b')
    hold on
    plot(t_basis, b4_basis,'m')
    hold on
    print(gcf,'-dpsc2','../img/img1b.eps');
    %% -----------------------------------------------------------------------------
end

%% Blossoming
pps =100;
x = size(1:1:length(k)*pps);
y = size(1:1:length(k)*pps);
x1 = size(1:1:pps);
y1 = size(1:1:pps);
x2 = size(1:1:pps);
y2 = size(1:1:pps);
count = 1;
K = k/(max(k));
if p_2_blossoming == 1
    for s=1:1:length(k)
        try
            % make step per each k, (break when s+1 exceeds the vector)
            step = (K(s+1) - K(s))/pps;
        catch err
            break
        end
        %Generate vector with t points between k(s+1) and k(s) with step (k(s+1) - k(s))/pps
        T = K(s):step:K(s+1);
        
        for i=1:1:pps
            t = T(i);
            fprintf('t(%g)=%g\n',i,t);
            x1(i) = polar_form(p_x_1,t,K);
            y1(i) = polar_form(p_y_1,t,K);
            x(count) = x1(i);
            y(count) = y1(i);
            count = count +1;
            if s == 7
                x2(i) = polar_form(p_x_2,t,K);
                y2(i) = polar_form(p_y_2,t,K);
            end          
        end
    end
    for i=1:1:pps
       x(count) = x2(i);
       y(count) = y2(i);
       count = count + 1;
    end
    %% Plot cuver in red. Control Points in blue
    figure,
    plot(x,y,'rx')
    hold on
    plot(p_x_1,p_y_1,'b*')
    hold on
    plot(p_x_2,p_y_2,'b*')
    hold on
    print(gcf,'-dpsc2','../img/img2.eps');
end


%% Casteljau
if p_4_casteljau == 1
    n = 5;
    pps = 100;
    % vector points seg 1: in x,y
    p_x_1 = [1 2 3 4 5.5];
    p_y_1 = [1 2 2.5 1.5 3];
    
    figure,
    for i=1:1:pps
        t = i/(pps-1);
        x = casteljau(p_x_1,1,n-1,t);
        y = casteljau(p_y_1,1,n-1,t);
        
        plot(x,y,'rx')
        hold on
        
    end
    plot(p_x_1,p_y_1,'b*')
    hold on
    print(gcf,'-dpsc2','../img/img4.eps');
end

totaltime = toc;
fprintf('\nExecution time %.2f[min] or %.2f [sec]\n', totaltime/60, totaltime);


