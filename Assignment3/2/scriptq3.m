    K= 7;               % number of clusters used

    L = 10;              % number of iterations
    seed = 14;           % seed used for random initialization
    scale_factor = 1.0;  % image downscale factor
    image_sigma = 1.0;   % image preblurring scale
    threshold=0.01;

    I = imread('orange.jpg');
    I = imresize(I, scale_factor);
    Iback = I;
    d = 2*ceil(image_sigma*2) + 1;
    h = fspecial('gaussian', [d d], image_sigma);
    I = imfilter(I, h);

    tic
    [ segm, centers ] = kmeans_segm(I, K, L, seed);
    %[ segm, centers, counter ] = kmeans_segm_thr(I, K,  seed,threshold);
    toc
    disp('#############################')
    disp(K)
    disp(counter)
    disp('#############################')
    Inew = mean_segments(Iback, segm);
    I = overlay_bounds(Iback, segm);
    imwrite(Inew,'\result/kmeans1orangeq3.png')
    imwrite(I,'/kmeans2orangeseq3.png')
    %disp(centers)
