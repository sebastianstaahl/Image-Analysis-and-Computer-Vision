close all;
clear;
F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';

figure(1);
showgrey(F.*G);
title('F.*G');

figure(2);
showfs(fft2(F.*G));  
title('fft2(F.*G)');

figure(3);
showgrey(F);
title('Image F');

figure(4);
showgrey(G);
title('Image G');

Fhat = fft2(F);
Ghat=fft2(G);

figure(5);
showgrey(log(1 + abs(fftshift(Fhat))));
title('Fhat');

figure(6);
showgrey(log(1 + abs(fftshift(Ghat))));
title('Ghat');

figure(7);
subplot(1,2,1);
[m,n]=size(F);
sz=m*n;
showfs(fftshift(conv2(fftshift(Fhat),fftshift(Ghat))/sz));
subplot(1,2,2);
showfs(fft2(F.*G));

figure(8);
surf(fftshift(abs(fft2(F.*G))));

figure(9);
surf(fftshift(abs(fft2(G))));

