function final_etp(centeringSolverType)
    import optimization.*;
    logPath = '/u/vvasuki/vishvas/work/optimization/hw/exam2/log/etp/';
    [Sigma, objOpt] = getData();
    n = size(Sigma, 1);
    ZInit = eye(n);
    xInit = zeros(n, 1);
    
    stoppingCriterion = @(Z, x, wt)stoppingCriterionBarrierMethod(Z, x, wt, Sigma);
    
    if(centeringSolverType == 'cvx')
        centeringProblemSolver = @(wt, Z_init)centeringSolver_cvx(Sigma, wt, Z_init);
    else
        centeringProblemSolver = @(wt, Z_init)centeringSolver(Sigma, wt, Z_init);
    end
    wtBoostFactor = 25;
    [ZValues, xValues] = DescentMethods.barrierSolver([], wtBoostFactor, ZInit, xInit, centeringProblemSolver, stoppingCriterion);
    figureHandle = DescentMethods.plotError(objOpt, xValues, @sum);
    figureName = func2str(centeringProblemSolver);
    IO.saveFigure(figureHandle, logPath, figureName);
    
    fprintf('objOpt: %d xValues goodness: ', objOpt);
    cellfun(@sum,xValues)
    fprintf('objOpt: %d ZValues goodness: ', objOpt);
    cellfun(@(Z)trace(Sigma*Z),ZValues)
%      cellfun(@(Z)objFunction(1, Sigma, Z),ZValues)
    
    display 'All done, ready for inspection';
    keyboard
end

function bStop = stoppingCriterionBarrierMethod(Z, x, wt, Sigma)
    bStop = (trace(Sigma*Z) - sum(x) <= 0.01*trace(Sigma*Z));
end

function SearchDirection = searchDirectionFinder(wt, Sigma, Z)
    n = size(Sigma, 1);
    m = [];
    m = (diag(wt*Z*Sigma*Z) - diag(Z))./(diag(Z*Z));
    SearchDirection = wt*Z*diag(m)*Z + Z - wt*Z*Sigma*Z;
    SearchDirection = 0.5*(SearchDirection + SearchDirection');
    SearchDirection = SearchDirection/(norm(SearchDirection));
%      SearchDirection = SearchDirection.*~eye(n);
    fprintf('sum(diag(SearchDirection)): %d norm: %d \n', sum(diag(SearchDirection)), norm(SearchDirection));
    fprintf('sum(x) = %d\n', sum(m)/wt);
%      fprintf('trace(Sigma*Z): %d\n',trace(Sigma*Z));
%      fprintf('trace(Sigma*(Z + SearchDirection)): %d\n',trace(Sigma*(Z + SearchDirection)));
end

function objValue = objFunction(wt, Sigma, Z)
    Z_c = chol(Z);
    lgdet = 2*sum(log(diag(Z_c)));
    objValue = wt*trace(Sigma*Z) - lgdet;
end

function [Z_iterates, x_iterates] = centeringSolver(Sigma, wt, Z_init)
    fprintf('wt: %d\n', wt);
    import optimization.*;
    objFn = @(Z)objFunction(wt, Sigma, Z);
    gradientFn = @(Z)wt*Sigma - pinv(Z);
    secantScaler = [];
    shrinkageFactor = [];
    cutoff = 10^-5;
    domainMembershipFn = @(Z) MatrixFunctions.positiveDefinitenessChecker(Z);
    searchDirectionFinderFn = @(Z)searchDirectionFinder(wt, Sigma, Z);
%      searchDirectionFinderFn = @(Z)-gradientFn(Z);
    stepSizeFinderFn = @(x, searchDirection)LineSearch.backtrackingSearchWrapper(x, searchDirection, objFn, gradientFn, secantScaler, shrinkageFactor, domainMembershipFn);
    stoppingCriterionFn = @(x, searchDirection)DescentMethods.stoppingCriterionNewton(x, searchDirection, cutoff, gradientFn);
    
    [Z_iterates] = DescentMethods.descentAlg(Z_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFn, [], objFn);
    x_iterates = {};
    for i = 1:length(Z_iterates)
        x_iterates{i} = getXFromOptZ(Sigma, Z_iterates{i}, wt);
    end
    Z_iterates = {Z_iterates{end}};
    x_iterates = {x_iterates{end}};
end

function [Z_iterates, x_iterates] = centeringSolver_cvx(Sigma, wt, Z_init)
    fprintf('wt: %d\n', wt);
    n = size(Sigma, 1);
    cvx_begin
    cvx_quiet(true);
    variable Z(n, n);
    minimize wt*trace(Sigma*Z) - log_det(Z);
    subject to
        for i=1:n
            Z(i,i) == 1;
        end
    cvx_end
    x = getXFromOptZ(Sigma, Z, wt);
    Z_iterates = {Z};
    x_iterates = {x};
end

function x = getXFromOptZ(Sigma, Z, wt)
    x = diag(Sigma - pinv(Z)/wt);
end

function [Sigma, objOpt] = getData()
    % Data for the educational testing problem
    randn('state',0);
    Sigma = randn(30,50);
    Sigma = Sigma * Sigma';
    objOpt = 183.7104;
end