function final_ellipse()
    import topology.*;
    X = getData();
    weights = [0.1:0.1:1];
    numWeights = length(weights);
    ellipsesX1 = {};
    ellipsesX2 = {};
    figureTitle = '';
    legendNames = {'X'};
    for i = 0:numWeights
        if i==0
            [A, b, area] = minVolumeEllipsoid(X);
            legendNames{end+1} = ['Lowner-Jones'];
            fprintf('Area: %d\n', area);
        else
            wtArea = weights(i);
            [A, b, area] = solveScalarizedAreaDistanceModel(X, wtArea);
            fprintf('Weight: %d, Area: %d\n', wtArea, area);
            legendNames{end+1} = ['wt = ' num2str(wtArea, 2)];
        end
        ellipse = R2Geometry.ellipseLoci_Ab(A, b);
        ellipsesX1{end+1} = ellipse(1,:);
        ellipsesX2{end+1} = ellipse(2,:);
    end
    filePrefix = '/u/vvasuki/vishvas/work/optimization/hw/exam2/log/ellipses/';
    figureName = 'ellipses';
    figureHandle = plot(X(1,:), X(2, :), 'd');
    hold on;
    figureHandle = IO.plotAndSave(ellipsesX1, ellipsesX2, 'x1', 'x2', filePrefix, figureName, figureTitle, legendNames, figureHandle);
    
    display 'All done, ready for inspection';
    keyboard
end

function [A, b, area] = solveScalarizedAreaDistanceModel(X, wtArea)
    import topology.*;
    n = size(X, 2);
    %  keyboard
    cvx_begin
    cvx_quiet(true);
    variable A(2,2);
    variable b(2, 1);
    variable t(n, 1);
    minimize(wtArea*det_inv(A) + sum(max(t - ones(n, 1), zeros(n, 1))));
    subject to
        A == semidefinite(2);
        for i = 1:n
            norm(A*X(:,i) + b) <= t(i);
        end
    cvx_end
    area = R2Geometry.ellipseArea_Ab(A);
end

function [A, b, area] = minVolumeEllipsoid(X)
    import topology.*;
    n = size(X, 2);
    %  keyboard
    cvx_begin
    cvx_quiet(true);
    variable A(2,2);
    variable b(2, 1);
    variable t(n, 1);
    minimize(det_inv(A));
    subject to
        A == semidefinite(2);
        for i = 1:n
            norm(A*X(:,i) + b) <= 1;
        end
    cvx_end
    area = R2Geometry.ellipseArea_Ab(A);
end

function X = getData()
    % Data for the Mahalanobis tradeoff ellipsoid covering problem
    randn('state',0);
    X = randn(2,100);
    % add a few outliers
    X(:,50) = 10*randn(2,1);
    X(:,80) = 10*randn(2,1);  
    X(:,30) = 10*randn(2,1);  
end

