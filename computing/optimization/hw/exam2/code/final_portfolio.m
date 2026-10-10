function final_portfolio
    [pbar, S] = getData();
    
    scalarizedObjFn = @(wtMeanReturn)solveScalarizedRiskReturnModel(pbar, S, wtMeanReturn);
    [XValues, meanReturnValues, obj2Values] = getTradeoffCurve_AreaPlot(scalarizedObjFn);
    
    scalarizedObjFn = @(wtMeanReturn)solveScalarizedTotalLossReturnModel(pbar, S, wtMeanReturn);
    [XValues, meanReturnValues, obj2Values] = getTradeoffCurve_AreaPlot(scalarizedObjFn);
    
    scalarizedObjFn = @(wtMeanReturn)solveScalarizedRiskReturnTotalLossModel(pbar, S, wtMeanReturn);
    [XValues, meanReturnValues, obj2Values] = getTradeoffCurve_AreaPlot(scalarizedObjFn);
    
    display 'All done, ready for inspection';
    keyboard
end

function [XValues, meanReturnValues, obj2Values] =getTradeoffCurve_AreaPlot(scalarizedObjFn)
    filePrefix = '/u/vvasuki/vishvas/work/optimization/hw/exam2/log/portfolio/';
    figureName = ['tradeoffCurve_'  func2str(scalarizedObjFn)];
    figureNameAllocation = ['allocationCurves_'  func2str(scalarizedObjFn)];
    
    [XValues, meanReturnValues, obj2Values] = optimization.VectorOptimization.getOptimalTradeoffs(scalarizedObjFn);
    figureHandle = IO.plotAndSave(obj2Values, meanReturnValues, 'Std Deviation or log(Pr(meanReturn \leq 0))', 'Mean Return', filePrefix, figureName);
    
    XValues = cell2mat(XValues);
    xData = {obj2Values, obj2Values, obj2Values};
    yData = {XValues(1,:)', XValues(1,:)'+XValues(2,:)', XValues(1,:)'+XValues(2,:)'+XValues(3,:)'};
    legendNames = {'x_1', 'x_1+x_2', 'x_1+x_2+x_3'};
    figureHandleArea = IO.plotAndSave(xData, yData, 'Std Deviation or log(Pr(meanReturn \leq 0))', 'Allocations', filePrefix, figureNameAllocation, '', legendNames);
end

function [x, meanReturn, stdDeviation] = solveScalarizedRiskReturnModel(pbar, S, wtMeanReturn)
    n = length(pbar);
    %  keyboard
    cvx_begin
    cvx_quiet(true);
    variable x(n,1);
    minimize(-wtMeanReturn*pbar'*x + (1-wtMeanReturn)*x'*S*x);
    subject to
        ones(n, 1)'*x == 1;
        x >= 0;
    cvx_end
    meanReturn = pbar'*x;
    stdDeviation = sqrt(x'*S*x);
end

function [x, meanReturn, logTotalLossProbability] = solveScalarizedTotalLossReturnModel(pbar, S, wtMeanReturn)
    import probabilisticModels.*;
    [x, meanReturn, stdDeviation] = solveScalarizedRiskReturnModel(pbar, S, wtMeanReturn);
    totalLossProbability = ExponentialFamily.normalCumulativeDensity(0, pbar'*x, sqrt(x'*S*x));
    logTotalLossProbability = log(totalLossProbability);
end

function [x, meanReturn, stdDeviation] = solveScalarizedRiskReturnTotalLossModel(pbar, S, wtMeanReturn)
    import probabilisticModels.*;
    SqrtS = sqrtm(S);
    n = length(pbar);
    %  keyboard
    cvx_begin
    cvx_quiet(true);
    variable x(n,1);
    minimize(-wtMeanReturn*pbar'*x + (1-wtMeanReturn)*x'*S*x);
    subject to
        ones(n, 1)'*x == 1;
        x >= 0;
        - ExponentialFamily.invNormalCumulativeDensity(0.005, 0, 1) * norm(SqrtS*x) - pbar'*x <= 0;
    cvx_end
    meanReturn = pbar'*x;
    stdDeviation = sqrt(x'*S*x);
end

function [pbar, S] = getData()
    % Data for the final exam portfolio design problem
    pbar = [.12 .10 .07  .03]';
    S = [0.0064 0.0008 -0.0011 0;
        0.0008 0.0025  0      0;
        -0.0011 0       0.0004 0;
        0      0       0      0];
end
