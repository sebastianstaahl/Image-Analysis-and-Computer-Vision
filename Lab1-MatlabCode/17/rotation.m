close all;
clear;

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)].*[zeros(128, 48) ones(128, 32) zeros(128, 48)];

figure(1);
showgrey(F);
title('Image F');

figure(2);
showfs(fft2(F));
title('Fourier spectrum F');

figure(3);
alpha = 30;
G = rot(F, alpha);
showgrey(G);
title('Image G (F rotated 30 degrees)');

figure(4);
Ghat = fft2(G);
showfs(Ghat);
title('Fourier spectrum Ghat(rotated 30 degrees)');

figure(5);
Hhat = rot(fftshift(Ghat), -alpha);
showgrey(log(1+abs(Hhat)));  
title('Fourier spectrum Hhat rotatet back 30 degrees');

alphas=[30,45,60,90];
sz=size(alphas);

figure(6);
subplot(2,4,1);
G = rot(F, 30);
showgrey(G);
title('30 degrees');

subplot(2,4,2);
showfs(fft2(G));
title('30 degrees fourier spectrum');

subplot(2,4,3);
K = rot(F, 45);
showgrey(K);
title('45 degrees');

subplot(2,4,4);
showfs(fft2(K)); 
title('45 degrees fourier spectrum');

subplot(2,4,5);
P = rot(F, 60);
showgrey(P);
title('60 degrees');

subplot(2,4,6);
showfs(fft2(P)); 
title('60 degrees fourier spectrum');

subplot(2,4,7);
S = rot(F, 90);
showgrey(S);
title('90 degrees');

subplot(2,4,8);
showfs(fft2(S)); 
title('90 degrees fourier spectrum');
