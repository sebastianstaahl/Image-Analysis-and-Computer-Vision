K = 3;               % number of clusters used
L = 10;              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = 1;  % image downscale factor
image_sigma = 1;   % image preblurring scale

I = imread('orange.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

tic
%[ segm, centers] = kmeans_segm(I, K, L, seed);
[ segm, centers,counter ] = kmeans_segm_thr(I, K,seed, 0.01);
disp(counter)
toc
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imshow(I)
title('image_sigma 1')
imwrite(Inew,'kmeansjj1.jpg')
imwrite(I,'kmeansjj2.jpg')

