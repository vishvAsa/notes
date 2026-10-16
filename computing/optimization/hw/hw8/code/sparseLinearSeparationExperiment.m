function sparseLinearSeparationExperiment
threshold = 10^-2;
hw8_sparse;
[thicknessMax, sparsityMin] = getSlabThicknessSparsity(X, Y, 0, threshold);
fprintf(1, 'Max thickness: %d min sparsity: %d \n', thicknessMax, sparsityMin);
%  return

thicknesses = [];
sparsities = [];
a_10ftr = [];
a = [];
for l = 0:5:100
    %  for lPow = -50:50:100
    %  l = 10^lPow;
    l
    [thicknesses(end+1), sparsities(end+1), a] = getSlabThicknessSparsity(X, Y, l, threshold);
    if(sparsities(end) > 39/50 && numel(a_10ftr) == 0)
        a_10ftr = a;
    end
    a'
%      keyboard
end

plotFigure(thicknesses, sparsities);

importantFeatureIndices = find(abs(a_10ftr) >= max(abs(a_10ftr))*threshold);
importantFeatureIndices
[thickness_10ftr, sparsities_10ftr, a] = getSlabThicknessSparsity(X(importantFeatureIndices, :), Y(importantFeatureIndices, :), 0, threshold);

display('All done, ready for inspection');
keyboard
end

function plotFigure(thicknesses, sparsities)
figureHandle = figure();
figureHandle = plot(sparsities, thicknesses);
xlabel('sparsity');
ylabel('slab thickness');
%  close all;
saveas(figureHandle, ['/u/vvasuki/vishvas/work/optimization/hw/hw8/code/sparseSeparation.jpg'], 'jpg');
end

function [thickness, sparsity, a] = getSlabThicknessSparsity(X, Y, l, threshold)
[n, N] = size(X);
M = size(Y, 2);
cvx_begin
variable a(n);
variable b;
minimize norm(a, 2) + l*norm(a, 1)
subject to
X'*a + b*ones(N,1) >= ones(N,1);
Y'*a + b*ones(M,1) <= -ones(M,1);
cvx_end
thickness = 2/norm(a,2);
sparsity = sum(abs(a) < max(abs(a))*threshold)/n;
end
