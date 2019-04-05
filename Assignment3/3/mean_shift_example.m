scale_factor = 0.5;       % image downscale factor
spatial_bandwidth = 20.0;  % spatial bandwidth
colour_bandwidth = 5.0;   % colour bandwidth
num_iterations = 40;      % number of mean-shift iterations
image_sigma = 1.0;        % image preblurring scale

I = imread('orange.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;  % ceil  round towards plus infinity
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

segm = mean_shift_segm(I, spatial_bandwidth, colour_bandwidth, num_iterations);
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imwrite(Inew,'C:\Users\Alexa\Desktop\KTH\kth åk4\BildBehandlingen\matlab\bildat_lab3\bildat_lab3\result\3\meanshift11.png')
imwrite(I,'C:\Users\Alexa\Desktop\KTH\kth åk4\BildBehandlingen\matlab\bildat_lab3\bildat_lab3\result\3\meanshift21.png')
subplot(1,2,1); imshow(Inew);
subplot(1,2,2); imshow(I);
title('colour bandwidth 5, spatial bandwidth 30')

