close all;
clear;

pic_phone= phonecalc128;

pic_few= few128;

pic_nallo= nallo128;
figure(1);

showgrey(pic_phone);

figure(2);

psf = gaussfft(deltafcn(128, 128), 0.1);

v01=variance(psf);
showgrey(psf);
title('variance= 0.1'); 

figure(3);
psf = gaussfft(deltafcn(128, 128), 0.3);
v03=variance(psf);
showgrey(psf);
title('variance= 0.3'); 

figure(4);
psf = gaussfft(deltafcn(128, 128), 1);
v1=variance(psf);
showgrey(psf);
title('variance= 1'); 

figure(5);
psf = gaussfft(deltafcn(128, 128), 10);
v10=variance(psf);
showgrey(psf);
title('variance= 10');

figure(6);
psf = gaussfft(deltafcn(128, 128), 100);
v100=variance(psf);
showgrey(psf);
title('variance= 100');

figure(7);
subplot(2,1,1);
showgrey(deltafcn(128, 128));
title('impulse 2D');
subplot(2,1,2);

surf(deltafcn(128, 128));
title('impulse 3D');




