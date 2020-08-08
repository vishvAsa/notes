%  load /u/vvasuki/vishvas/work/statistics/hw3/3gaussian/3gaussian

%  Common code
numLabels = numel(unique(labels));
%  returns 1, 2, 3

[numPoints, numFeatures] = size(X);


%  Add a feature.
X1 = X;
X1(:, 3) = ones(numPoints, 1);
numFeatures = numFeatures + 1;

%  Using 1 of 3 encoding for labels
Y = zeros(numPoints, numLabels);
label1spots = find(labels == 1);
label2spots = find(labels == 2);
label3spots = find(labels == 3);
Y(label1spots, 1) = 1;
Y(label2spots, 2) = 1;
Y(label3spots, 3) = 1;

%  Do Least squares.
% Find W.
W = zeros(numFeatures, numLabels);
W = inv(X1'*X1)*(X1'*Y);
predictionLsq = X1*W;
%  Now, find the 1 of 3 vector with max correlation.
maxCorrelation = max(predictionLsq,[],2);
predictionLsq(:,1) = (predictionLsq(:,1) == maxCorrelation);
predictionLsq(:,2) = (predictionLsq(:,2) == maxCorrelation);
predictionLsq(:,3) = (predictionLsq(:,3) == maxCorrelation);

%  Plot actual data
%  plot(X(label1spots,1),X(label1spots,2), '*', X(label2spots,1),X(label2spots,2), '+', X(label3spots,1),X(label3spots,2), 'x')
label1spotsLsq = find(predictionLsq(:,1) == 1);
label2spotsLsq = find(predictionLsq(:,2) == 1);
label3spotsLsq = find(predictionLsq(:,3) == 1);

%  plot(X(label1spotsLsq,1),X(label1spotsLsq,2), '*', X(label2spotsLsq,1),X(label2spotsLsq,2), '+', X(label3spotsLsq,1),X(label3spotsLsq,2), 'x')

%  Do logistic regression.
w = zeros(numFeatures*numLabels,1);
for k=1:100
    W = reshape(w,numFeatures,numLabels);
    expA_k = exp(X1*W);
    InvSumExpA_k = inv(diag(sum(expA_k,2)));
    Probability = InvSumExpA_k*expA_k;
    %  Find the gradient
    GradientMatrix = X1'*(Probability-Y);
    
    %  Find the Hessian
    H = zeros(numFeatures*numLabels);
    I = eye(numLabels*numLabels);
    for i = 1:numLabels
        for j = 1:numLabels
            wt = zeros(numPoints,1);
            for n= 1:numPoints
                wt(n) = Probability(n,i)*(I(i,j) - Probability(n,j));
                H((i-1)*numFeatures + 1:i*numFeatures, (j-1)*numFeatures + 1:j*numFeatures) = H((i-1)*numFeatures + 1:i*numFeatures, (j-1)*numFeatures + 1:j*numFeatures) + wt(n)*X1(n,:)'*X1(n,:);
            end
        end
    end
    w = w - inv(H)*GradientMatrix(:);
%      w
end

label1spotsPr = find(Probability(:,1) == 1);
label2spotsPr = find(Probability(:,2) == 1);
label3spotsPr = find(Probability(:,3) == 1);

plot(X(label1spotsPr,1),X(label1spotsPr,2), '*', X(label2spotsPr,1),X(label2spotsPr,2), '+', X(label3spotsPr,1),X(label3spotsPr,2), 'x')
