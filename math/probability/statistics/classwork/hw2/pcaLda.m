%  load /u/vvasuki/vishvas/work/statistics/hw2/hw2data/dataset1
load /u/vvasuki/vishvas/work/statistics/hw2/hw2data/dataset2

%  Common code
[numPoints, numFeatures] = size(X)

L = unique(labels);
X_1s=find(labels==1);
X_2s=find(labels==2);
X_3s=find(labels==3);

mean_1 = sum(X(X_1s,:),1)./numel(X_1s);
mean_2 = sum(X(X_2s,:),1)./numel(X_2s);
mean_3 = sum(X(X_3s,:),1)./numel(X_3s);
mean = sum(X,1)./numPoints;



%  Code for LDA
%  S_B = numel(X_1s)* (mean_1 - mean)'*(mean_1 - mean) + numel(X_2s)* (mean_2 - mean)'*(mean_2 - mean) + numel(X_3s)* (mean_3 - mean)'*(mean_3 - mean);
%  
%  S_W = zeros(numFeatures,numFeatures);
%  for i=(X_1s')
%      S_W = S_W + (X(i,:) - mean_1)'*(X(i,:) - mean_1);
%  end
%  for i=(X_2s')
%      S_W = S_W + (X(i,:) - mean_2)'*(X(i,:) - mean_2);
%  end
%  for i=(X_3s')
%      S_W = S_W + (X(i,:) - mean_3)'*(X(i,:) - mean_3);
%  end
%  
%  %    [U S V] = svd(inv(sqrtm(S_W))*S_B*inv(sqrtm(S_W)));
%  [V L] = eig(inv(S_W)*S_B);
%  [U R] = qr(V);
%  projectedData = X*U(:,1:2);
%  plot(projectedData(:,1),projectedData(:,2), '*')
%  projectedMean_1 = mean_1*U(:,1:2)
%  projectedMean_2 = mean_2*U(:,1:2)
%  projectedMean_3 = mean_3*U(:,1:2)
%  text(projectedMean_1(1), projectedMean_1(2), 'Cluster 1')
%  text(projectedMean_2(1), projectedMean_2(2), 'Cluster 2')
%  text(projectedMean_3(1), projectedMean_3(2), 'Cluster 3')

%  %  Code for PCA
%  
Y = X - ones(numPoints, 1)*mean;
%  sum(Y,1)
covariance = Y'*Y;
[U S V] = svd(covariance);
projectedData = Y*U(:,1:2);
plot(projectedData(:,1),projectedData(:,2), '*')
projectedMean_1 = mean_1*U(:,1:2)
projectedMean_2 = mean_2*U(:,1:2)
projectedMean_3 = mean_3*U(:,1:2)
text(projectedMean_1(1), projectedMean_1(2), 'Cluster 1')
text(projectedMean_2(1), projectedMean_2(2), 'Cluster 2')
text(projectedMean_3(1), projectedMean_3(2), 'Cluster 3')
