scale_factor = 0.5;          % image downscale factor
area = [ 80, 110, 570, 300 ] % image region to train foreground with
%area= [ 187, 149, 560,470 ]
K = 6;                      % number of mixture components
alpha = 20.0;                 % maximum edge cost
sigma = 15.0;                % edge cost decay factor
%20 16 7
I = imread('tiger3.jpg');
disp(size(I));
I = imresize(I, scale_factor);
Iback = I;
area = int16(area*scale_factor);
[ segm, prior ] = graphcut_segm(I, area, K, alpha, sigma);

Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imwrite(Inew,'graphcut1.png')
imwrite(I,'graphcut2.png')
imwrite(prior,'graphcut3.png')
subplot(2,2,1); imshow(Inew);
subplot(2,2,2); imshow(I);
subplot(2,2,3); imshow(prior);
title('K=5, alpha=20, sigma=15')
