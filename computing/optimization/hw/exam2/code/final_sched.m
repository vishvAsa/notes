function final_sched()
[n, T, Smin, Smax, R, alpha, beta, gamma, A, D, W, Wmax] = getData();
cvx_begin
cvx_quiet(true);
variables S(n, T);
variable s(T,1);
minimize sum(alpha*ones(T, 1) + beta*s + gamma*s.^2);
subject to
    sum(S, 1) == s';
    S >= zeros(n, T);
    sum(S, 2) >= W;
    for i=1:n
        S(i, 1:A(i)-1) == 0;
        S(i, D(i)+1:end) == 0;
    end
cvx_end
theta = normc(S);
figureHandle = figure();
bar(S', 1, 'stacked');
filePrefix = '/u/vvasuki/vishvas/work/optimization/hw/exam2/log/';
figureName = 'schedule';
IO.saveFigure(figureHandle, filePrefix, figureName, S);

fprintf('final energy: %d\n', energyFn(s, alpha, beta, gamma));

display 'All done, ready for inspection';
keyboard
end

function energy = energyFn(s, alpha, beta, gamma)
    T = length(s);
    energy = sum(alpha*ones(T, 1) + beta*s + gamma*s.^2);
end

function [n, T, Smin, Smax, R, alpha, beta, gamma, A, D, W, Wmax] = getData()
    % Data for minimum energy processor speed scheduling.
    
    n = 12;  % number of jobs.
    T = 16;  % number of time periods.
    
    Smin = 1;  % min processor speed.
    Smax = 4;  % max processor speed.
    R = 1;  % max slew rate.
    
    % Parameters in power/speed model.
    alpha = 1;
    beta = 1;
    gamma = 1;
    
    % Job arrival times and deadlines.
    A = [1; 3;  4; 6; 9;  9; 11; 12; 13; 13; 14; 15];
    D = [3; 6; 11; 7; 9; 12; 13; 15; 15; 16; 14; 16];
    % Total work for each job.
    W = [2; 4; 10; 2; 3; 2; 3; 2; 3; 4; 1; 4];
    Wmax = max(W./(D-A+1));
    
    % Plot showing job availability times & deadlines.
    figure;
    hold on;
    for i=1:n
        wid = 0.5 * W(i) / (D(i)-A(i)+1) / Wmax;
        plot([A(i)-0.5,D(i)+0.5,D(i)+0.5,A(i)-0.5,A(i)-0.5],...
            [i-wid,i-wid,i+wid,i+wid,i-wid],'k-');
    end
    for i=1:max(D),
        plot([i,i],[0,13],'k:');
    end
    hold off;
    axis([0,max(D)+1,0,n+1]);
    xlabel('time t');
    ylabel('job i');
    close all;
end