close all;
clear;
I1=[zeros(60, 128); ones(8, 128); zeros(60, 128)];
I2=[zeros(128, 48) ones(128, 32) zeros(128, 48)];
F = [zeros(60, 128); ones(8, 128); zeros(60, 128)].*[zeros(128, 48) ones(128, 32) zeros(128, 48)];

figure(1);
showgrey(F);
title('Image F');

figure(2);
showgrey(I1);
title('Image I1');

figure(3);
showgrey(I2);
title('Image I2');

Fprev = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = Fprev';


figure(4);
showgrey(Fprev.*G);
title('Fprev.*G');

figure(5);

showfs(fft2(Fprev.*G));
title('Fourier spectrum Fprev - unscaled');

figure(6);
showfs(fft2(F));
title('Fourier spectrum F - scaled');