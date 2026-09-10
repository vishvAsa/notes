% tv_img_interp.m
% Total variation image interpolation.
% EE364a
% Defines m, n, Uorig, Known.

% Load original image.
Uorig = double(imread('flowgray.png'));

[m, n] = size(Uorig);

% Create 50% mask of known pixels.
rand('state', 1029);
Known = rand(m,n) > 0.5;

%%%%% Put your solution code here
cvx_begin
variable Ul2(m, n);
variable T(m-1, n-1);
minimize sum(sum((Ul2(2:end, 2:end) - Ul2(1:end-1,2:end)).^2 + (Ul2(2:end, 2:end) - Ul2(2:end,1:end-1)).^2))
subject to
Ul2 .* Known == Uorig .* Known;
cvx_end

cvx_begin
variable Utv(m, n);
variable T(m-1, n-1);
minimize sum(sum(abs(Utv(2:end, 2:end) - Utv(1:end-1,2:end)) + abs(Utv(2:end, 2:end) - Utv(2:end,1:end-1))))
subject to
Utv .* Known == Uorig .* Known;
cvx_end

% Calculate and define Ul2 and Utv.

%%%%%

% Graph everything.
figureHandle = figure(1); cla;
colormap gray;

subplot(221);
imagesc(Uorig)
title('Original image');
axis image;

subplot(222);
imagesc(Known.*Uorig + 256-150*Known);
title('Obscured image');
axis image;

subplot(223);
imagesc(Ul2);
title('l_2 reconstructed image');
axis image;

subplot(224);
imagesc(Utv);
title('Total variation reconstructed image');
axis image;

saveas(figureHandle, ['/u/vvasuki/vishvas/work/optimization/hw/hw8/code/imageInterpolation.jpg'], 'jpg');
%  close all;
