close all;
clear;

F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)]; %original F
G = F';
H = F + 2 * G;

%The images
subplot(3, 2, 1);
showgrey(F);
title('image F')

subplot(3, 2, 2);
showgrey(G);
title('image G')

subplot(3, 2, 3);
showgrey(H);
title('image H');

%the discrete Fourier transforms
Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);

%fourier spectras
figure(2);
subplot(3,2,1);
showgrey(log(1 + abs(Fhat)));
title('fourier spectra Fhat');

subplot(3,2,2);
showgrey(log(1 + abs(Ghat)));
title('fourier spectra Ghat');

subplot(3,2,3);
showgrey(log(1 + abs(Hhat)));
title('fourier spectra Hhat');

%Centered fourier spectrums
figure(3);
subplot(2,2,1);
showgrey(log(1+abs(fftshift(Fhat))));
title('log(1+abs(fftshift(Fhat)))');

subplot(2,2,2);
showgrey(log(1+abs(fftshift(Hhat))));
title('log(1+abs(fftshift(Hhat)))');

subplot(2,2,3);
showgrey(log(1+abs(fftshift(Ghat))));
title('log(1+abs(fftshift(Ghat)))');


%fourier spectra in 3D to see sinc function 
figure(4);
surf(log(1+abs(fftshift(Fhat))));
title('3D log(1+abs(fftshift(Fhat)))');

%Linearity fourier transform before or after addition
figure(5);
subplot(1,2,1);

Hhat2=Fhat+2*Ghat;
showgrey(log(1+abs(fftshift(Hhat2))));
title('fourier transform and then sum');

subplot(1,2,2);
showgrey(log(1+abs(fftshift(Hhat))));
title('sum and then fourier transform');











