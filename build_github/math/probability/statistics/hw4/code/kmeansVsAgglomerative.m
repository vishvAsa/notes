%  load iris;
%  
%  %  Normalize data
%  X = inv(diag(sum(X, 2)))*X;
%  numClasses = numel(unique(classid));

tic
partitionKMeans = kmeans(X,numClasses);
toc
display 'kmeans confusion matrix'
confusionMatrixKMeans = ClusterUtils.getConfusionMatrix(partitionKMeans, classid)

%  tic
%  partitionAgglomerative = Agglomerative.singleLink(X,numClasses);
%  toc
%  display 'Agglomerative clustering confusion matrix'
%  confusionMatrixAgg = ClusterUtils.getConfusionMatrix(partitionAgglomerative', classid)
%  
